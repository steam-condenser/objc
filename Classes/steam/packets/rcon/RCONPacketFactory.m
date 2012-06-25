/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "ByteBuffer.h"
#import "PacketFormatException.h"
#import "RCONAuthResponse.h"
#import "RCONExecResponse.h"
#import "RCONPacket.h"
#import "RCONPacketFactory.h"


@implementation RCONPacketFactory

+(RCONPacket*) getPacketFromData:(NSMutableData*) packetData {
    RCONPacket* packet;
    ByteBuffer* byteBuffer = [ByteBuffer wrap:packetData];
    
    // ignore packet size
    [byteBuffer getLong];
    long requestId = [byteBuffer getLong];
    long header = [byteBuffer getLong];
    NSData* data = [[byteBuffer getString] dataUsingEncoding:NSASCIIStringEncoding];
    
    switch(header) {
        case SERVERDATA_AUTH_RESPONSE:
            packet = [[RCONAuthResponse alloc] initWithRequestId:requestId];
            break;
        case SERVERDATA_RESPONSE_VALUE:
            packet = [[RCONExecResponse alloc] initWithRequestId:requestId andCommandReturn:data];
            break;
        default:
            @throw [[PacketFormatException alloc] initWithMessage:[NSString stringWithFormat:@"Unknown packet with header %d received.", header]];
    }
    
    return packet;
}

@end
