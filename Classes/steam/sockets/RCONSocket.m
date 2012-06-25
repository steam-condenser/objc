/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONPacketFactory.h"
#import "RCONSocket.h"
#import "SocketChannel.h"
#import "SteamCondenserException.h"
#import "TimeoutException.h"

@implementation RCONSocket

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber {
    self = [super initWithHost:host andPort:portNumber];
    channel = [SocketChannel open];    
    return self;
}

-(RCONPacket*) getReply {
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
    
    return [RCONPacketFactory getPacketFromData:packetData];
}

-(int) receivePacket:(int) bufferLength {
    if(![[channel socket] select:1]) {
        @throw [[TimeoutException alloc] init];
    }
    
    if(bufferLength == 0) {
        [buffer clear];
    }
    else {
        buffer = [ByteBuffer allocate:bufferLength];
    }
    
    int bytesRead = [(SocketChannel*) channel read:buffer];
    if(bytesRead == 0) {
        @throw [[SteamCondenserException alloc] initWithMessage:@"No answer received. Maybe you have been banned."];
    }
    [buffer rewind];
    [buffer setLimit:bytesRead];
    
    return bytesRead;
}

-(void) send:(RCONPacket*) dataPacket {
    if(![(SocketChannel*) channel isConnected]) {
        [(SocketChannel*) channel connectWithHost:remoteHost andPort:remotePort];
    }

    [super send:dataPacket];
}

-(void) dealloc {
    [(SocketChannel*) channel close];
    [super dealloc];
}

@end
