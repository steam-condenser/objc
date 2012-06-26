/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCByteBuffer.h"
#import "SCTCPSocket.h"
#import "SCSelectableChannel.h"

@interface SCSocketChannel : SCSelectableChannel {
@private
    BOOL connected;
}

+ (SCSocketChannel *)open;
- (id)init;
- (void)close;
- (SCSocketChannel *)connectWithHost:(NSHost *)remoteHost
                             andPort:(uint16_t)remotePort;
- (BOOL)isConnected;
- (NSUInteger)read:(SCByteBuffer *)destinationBuffer;
- (NSUInteger)write:(SCByteBuffer *)sourceBuffer;

@end
