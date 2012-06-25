/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONPacketFactory.h"
#import "SCRCONSocket.h"
#import "SCSocketChannel.h"
#import "SCException.h"
#import "SCTimeoutException.h"

@implementation SCRCONSocket

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber {
    self = [super initWithHost:host andPort:portNumber];
    channel = [SCSocketChannel open];    
    return self;
}

-(SCRCONPacket*) getReply {
    [self receivePacket:RCON_PACKET_MAX_SIZE];
    NSRange range = {0, [buffer limit]};
    NSMutableData* packetData = [NSMutableData dataWithData:[[buffer array] subdataWithRange:range]];
    unsigned long packetSize = [buffer getLong] + 4;
    if(packetSize > RCON_PACKET_MAX_SIZE) {
        int remainingBytes = packetSize - RCON_PACKET_MAX_SIZE;
        do {
            [self receivePacket:MIN(remainingBytes, RCON_PACKET_MAX_SIZE)];
            NSRange range = {0, [buffer limit]};
            [packetData appendData:[[buffer array] subdataWithRange:range]];
            remainingBytes -= range.length;
        } while(remainingBytes > 0);
    }
    
    return [SCRCONPacketFactory getPacketFromData:packetData];
}

-(int) receivePacket:(int) bufferLength {
    if(![[channel socket] select:1]) {
        @throw [[SCTimeoutException alloc] init];
    }
    
    if(bufferLength == 0) {
        [buffer clear];
    }
    else {
        buffer = [SCByteBuffer allocate:bufferLength];
    }
    
    int bytesRead = [(SCSocketChannel*) channel read:buffer];
    if(bytesRead == 0) {
        @throw [[SCException alloc] initWithMessage:@"No answer received. Maybe you have been banned."];
    }
    [buffer rewind];
    [buffer setLimit:bytesRead];
    
    return bytesRead;
}

-(void) send:(SCRCONPacket*) dataPacket {
    if(![(SCSocketChannel*) channel isConnected]) {
        [(SCSocketChannel*) channel connectWithHost:remoteHost andPort:remotePort];
    }

    [super send:dataPacket];
}

-(void) dealloc {
    [(SCSocketChannel*) channel close];
    [super dealloc];
}

@end
