/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONPacket.h"

@implementation SCRCONPacket

- (id)initWithRequestId:(uint32_t)packetRequestId
              andHeader:(uint32_t)rconHeader
                andData:(NSData *)rconData
{
    self = [super initWithData:rconData];
    header = rconHeader;
    requestId = packetRequestId;
    
    return self;
}

- (NSData *)getData
{
    NSUInteger dataLength = [contentData getLength];
    NSMutableData *bytes = [[NSMutableData alloc] initWithLength:0];
    unsigned int packetLength = dataLength + 10;

    [bytes appendData:[NSData dataWithBytes:(uint8_t *)&packetLength length:4]];
    [bytes appendData:[NSData dataWithBytes:(uint8_t *)&requestId length:4]];
    [bytes appendData:[NSData dataWithBytes:(uint8_t *)&header length:4]];
    [bytes appendData:[contentData array]];
    [bytes increaseLengthBy:2];

    return bytes;
}

- (unsigned long) getRequestId
{
    return requestId;
}

@end
