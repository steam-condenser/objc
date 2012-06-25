/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import <netdb.h>

#import "SocketChannel.h"
#import "SteamCondenserException.h"


@implementation SocketChannel

+(SocketChannel*) open {
    return [[self alloc] init];
}

-(id) init {
    socket = [[TCPSocket alloc] init];
    [socket setBlock:true];
    connected = false;
    
    return self;
}

-(void) close {
    [(TCPSocket*) socket close];
}
    
-(SocketChannel*) connectWithHost:(NSHost*) remoteHost andPort:(int) remotePort {
    [(TCPSocket*) socket connectWithHost:remoteHost andPort:remotePort];
    connected = true;

    return self;
}

-(bool) isConnected {
    return connected;
}

-(int) read:(ByteBuffer*) destinationBuffer {
    int length = [destinationBuffer getLength];
    NSData* data = [socket recv:length];
    [destinationBuffer put:data];
    
    return [data length];
}

-(int) write:(ByteBuffer*) sourceBuffer {
    return [socket send:[sourceBuffer get]];
}

@end
