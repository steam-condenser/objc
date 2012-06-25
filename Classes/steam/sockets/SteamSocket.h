/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "ByteBuffer.h"
#import "SelectableChannel.h"


@interface SteamSocket : NSObject {
@protected
    ByteBuffer* buffer;
    SelectableChannel* channel;
    NSHost* remoteHost;
    int remotePort;
}

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber;
-(SteamPacket*) getReply;
//-(void) receivePacket:(int) length;
-(void) send:(SteamPacket*) dataPacket;

@end
