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

+ (SCSocketChannel *)open
{
    return [[self alloc] init];
}

- (id)init
{
    socket = [[SCTCPSocket alloc] init];
    [socket setBlock:YES];
    connected = NO;
    
    return self;
}

- (void)close
{
    [(SCTCPSocket *)socket close];
}
    
- (SCSocketChannel *)connectWithHost:(NSHost *)remoteHost
                             andPort:(uint16_t)remotePort
{
    [(SCTCPSocket*) socket connectWithHost:remoteHost andPort:remotePort];
    connected = YES;

    return self;
}

- (BOOL)isConnected
{
    return connected;
}

- (NSUInteger)read:(SCByteBuffer *)destinationBuffer
{
    NSUInteger length = [destinationBuffer getLength];
    NSData *data = [socket recv:length];
    [destinationBuffer put:data];
    
    return [data length];
}

- (NSUInteger)write:(SCByteBuffer *)sourceBuffer
{
    return [socket send:[sourceBuffer get]];
}

@end
