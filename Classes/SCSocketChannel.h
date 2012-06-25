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
    bool connected;
}

+(SCSocketChannel*) open;
-(id) init;
-(void) close;
-(SCSocketChannel*) connectWithHost:(NSHost*) remoteHost andPort:(int) remotePort;
-(bool) isConnected;
-(int) read: (SCByteBuffer*) destinationBuffer;
-(int) write: (SCByteBuffer*) sourceBuffer;

@end
