/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONPacket.h"
#import "SocketChannel.h"
#import "SteamSocket.h"

#define RCON_PACKET_MAX_SIZE 1440

@interface RCONSocket : SteamSocket {

}

-(RCONPacket*) getReply;
-(int) receivePacket:(int) bufferLength;
-(void) send:(RCONPacket*) packet;

@end
