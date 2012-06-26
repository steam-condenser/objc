/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCSteamPacket.h"

#define S2A_INFO_DETAILED_HEADER 0x6D
#define A2S_INFO_HEADER 0x54
#define S2A_INFO2_HEADER 0x49
#define A2A_PING_HEADER 0x69
#define A2A_ACK_HEADER 0x6A
#define A2S_PLAYER_HEADER 0x55
#define S2A_PLAYER_HEADER 0x44
#define A2S_RULES_HEADER 0x56
#define S2A_RULES_HEADER 0x45
#define A2S_SERVERQUERY_GETCHALLENGE_HEADER 0x57
#define S2C_CHALLENGE_HEADER 0x41
#define A2M_GET_SERVERS_BATCH2_HEADER 0x31
#define M2A_SERVER_BATCH_HEADER 0x66
#define S2C_CONNREJECT_HEADER 0x39
#define RCON_GOLDSRC_CHALLENGE_HEADER 0x63
#define RCON_GOLDSRC_NO_CHALLENGE_HEADER 0x39
#define RCON_GOLDSRC_RESPONSE_HEADER 0x6C

@implementation SCSteamPacket

- (id)initWithData:(NSData *)packetData
{
    self = [self initWithHeader:0x00 andData:packetData];

    return self;
}

- (id)initWithHeader:(uint8_t)packetHeader andData:(NSData *)packetData
{
    self = [super init];

    contentData = [SCByteBuffer wrap:packetData];
    headerData = packetHeader;

    return self;
}

- (NSData *)getData
{
    uint32_t packetHeader = 0xFFFFFFFF;
    NSMutableData* bytes = [[NSMutableData alloc] initWithLength:0];

    [bytes appendData:[NSData dataWithBytes:(uint8_t *)&packetHeader length:4]];
    [bytes appendData:[NSData dataWithBytes:(uint8_t *)&headerData length:1]];
    [bytes appendData:[contentData array]];

    return bytes;
}

@end
