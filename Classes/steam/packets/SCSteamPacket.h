/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCByteBuffer.h"

@interface SCSteamPacket : NSObject {
    SCByteBuffer* contentData;
    uint8_t headerData;
}

- (id)initWithData:(NSData *)packetData;
- (id)initWithHeader:(uint8_t)packetHeader andData:(NSData *)packetData;
- (NSData *)getData;

@end
