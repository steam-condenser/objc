/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONPacket.h"
#import "SCSteamPacketFactory.h"


@interface SCRCONPacketFactory : SCSteamPacketFactory {

}

+(SCRCONPacket*) getPacketFromData:(NSMutableData*) packetData;

@end
