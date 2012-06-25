/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import <netdb.h>

#import "SCException.h"
#import "SCSocketChannel.h"


@implementation SCSocketChannel

+(SCSocketChannel*) open {
    return [[self alloc] init];
}

-(id) init {
    socket = [[SCTCPSocket alloc] init];
    [socket setBlock:true];
    connected = false;
    
    return self;
}

-(void) close {
    [(SCTCPSocket*) socket close];
}
    
-(SCSocketChannel*) connectWithHost:(NSHost*) remoteHost andPort:(int) remotePort {
    [(SCTCPSocket*) socket connectWithHost:remoteHost andPort:remotePort];
    connected = true;

    return self;
}

-(bool) isConnected {
    return connected;
}

-(int) read:(SCByteBuffer*) destinationBuffer {
    int length = [destinationBuffer getLength];
    NSData* data = [socket recv:length];
    [destinationBuffer put:data];
    
    return [data length];
}

-(int) write:(SCByteBuffer*) sourceBuffer {
    return [socket send:[sourceBuffer get]];
}

@end
