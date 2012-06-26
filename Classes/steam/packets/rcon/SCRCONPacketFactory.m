/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCByteBuffer.h"
#import "SCPacketFormatException.h"
#import "SCRCONAuthResponse.h"
#import "SCRCONExecResponse.h"
#import "SCRCONPacket.h"
#import "SCRCONPacketFactory.h"

@implementation SCRCONPacketFactory

+ (SCRCONPacket*)getPacketFromData:(NSMutableData *)packetData
{
    SCRCONPacket* packet;
    SCByteBuffer* byteBuffer = [SCByteBuffer wrap:packetData];
    
    // ignore packet size
    [byteBuffer getLong];
    uint32_t requestId = [byteBuffer getLong];
    uint32_t header = [byteBuffer getLong];
    NSData* data = [[byteBuffer getString] dataUsingEncoding:NSASCIIStringEncoding];
    
    switch (header) {
        case SERVERDATA_AUTH_RESPONSE:
            packet = [[SCRCONAuthResponse alloc] initWithRequestId:requestId];
            break;
        case SERVERDATA_RESPONSE_VALUE:
            packet = [[SCRCONExecResponse alloc] initWithRequestId:requestId andCommandReturn:data];
            break;
        default:
            @throw [[SCPacketFormatException alloc] initWithMessage:[NSString stringWithFormat:@"Unknown packet with header %d received.", header]];
    }
    
    return packet;
}

@end
