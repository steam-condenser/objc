/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "ByteBuffer.h"
#import "TCPSocket.h"
#import "SelectableChannel.h"

@interface SocketChannel : SelectableChannel {
@private
    bool connected;
}

+(SocketChannel*) open;
-(id) init;
-(void) close;
-(SocketChannel*) connectWithHost:(NSHost*) remoteHost andPort:(int) remotePort;
-(bool) isConnected;
-(int) read: (ByteBuffer*) destinationBuffer;
-(int) write: (ByteBuffer*) sourceBuffer;

@end
