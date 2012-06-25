/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCByteBuffer.h"
#import "SCSelectableChannel.h"


@interface SCSteamSocket : NSObject {
@protected
    SCByteBuffer* buffer;
    SCSelectableChannel* channel;
    NSHost* remoteHost;
    int remotePort;
}

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber;
-(SCSteamPacket*) getReply;
//-(void) receivePacket:(int) length;
-(void) send:(SCSteamPacket*) dataPacket;

@end
