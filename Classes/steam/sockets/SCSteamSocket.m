/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCDatagramChannel.h"
#import "SCSteamPacket.h"
#import "SCSteamSocket.h"
#import "SCTimeoutException.h"


@implementation SCSteamSocket

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber {
    //buffer = [ByteBuffer allocate:1400];
    remoteHost = host;
    remotePort = portNumber;
    return self;
}

-(SCSteamPacket*) getReply {
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

-(void) send:(SCSteamPacket*) dataPacket {
    NSData* bytes = [dataPacket getData];
    [channel write:[SCByteBuffer wrap:bytes]];
}

@end
