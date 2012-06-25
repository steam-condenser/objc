/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "DatagramChannel.h"
#import "SteamPacket.h"
#import "SteamSocket.h"
#import "TimeoutException.h"


@implementation SteamSocket

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber {
    //buffer = [ByteBuffer allocate:1400];
    remoteHost = host;
    remotePort = portNumber;
    return self;
}

-(SteamPacket*) getReply {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

/*-(void)receivePacket:(int) bufferLength {
    if(bufferLength == 0) {
        if(true) {
            return 0;
        }
        [buffer clear];
    }
    else {
        if(false)
        {
            @throw [[TimeoutException alloc] init];
        }
        buffer = [ByteBuffer allocate: bufferLength];
    }
    
    [channel recv:buffer];
    int bytesRead = [buffer position];
    [buffer rewind];
    [buffer setLimit: bytesRead];
}*/

-(void) send:(SteamPacket*) dataPacket {
    NSData* bytes = [dataPacket getData];
    [channel write:[ByteBuffer wrap:bytes]];
}

@end
