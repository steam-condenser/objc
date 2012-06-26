/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONPacket.h"
#import "SCSocketChannel.h"
#import "SCSteamSocket.h"

#define RCON_PACKET_MAX_SIZE 1440

@interface SCRCONSocket : SCSteamSocket

- (SCRCONPacket *)getReply;
- (NSUInteger)receivePacket:(NSUInteger)bufferLength;
- (void)send:(SCRCONPacket *)packet;

@end
