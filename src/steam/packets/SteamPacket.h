/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "ByteBuffer.h"


@interface SteamPacket : NSObject {
    ByteBuffer* contentData;
    uint8_t headerData;
}

-(id) initWithData:(NSData*) packetData;
-(id) initWithHeader:(uint8_t) packetHeader andData:(NSData*) packetData;
-(NSData*) getData;

@end
