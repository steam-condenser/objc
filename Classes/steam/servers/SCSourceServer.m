/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONAuthRequest.h"
#import "SCRCONAuthResponse.h"
#import "SCRCONExecRequest.h"
#import "SCRCONExecResponse.h"
#import "SCRCONNoAuthException.h"
#import "SCRCONPacket.h"
#import "SCSourceServer.h"
#import "SCTimeoutException.h"

@implementation SCSourceServer

- (id)initWithHost:(NSHost *)host
{
    self = [self initWithHost:host andPort:27015];

    return self;
}

- (id)initWithHost:(NSHost *)host andPort:(uint16_t)portNumber
{
    self = [super initWithHost:host andPort:portNumber];

    rconSocket = [[SCRCONSocket alloc] initWithHost:host andPort:portNumber];
    //socket = [[SourceSocket alloc] init:ipAddress:portNumber];

    return self;
}

- (BOOL)rconAuth:(NSString *)password
{
    time_t seed;
    time(&seed);
    srandom(seed);
    rconRequestId = random();

    [rconSocket send:[[SCRCONAuthRequest alloc] initWithRequestId:rconRequestId withPassword:[password dataUsingEncoding:NSASCIIStringEncoding]]];
    [rconSocket getReply];
    SCRCONPacket *reply = [rconSocket getReply];

    uint32_t mirroredRequestId = [reply getRequestId];

    return (mirroredRequestId == rconRequestId);
}

- (NSString *)rconExec:(NSString*) command
{
    [rconSocket send:[[SCRCONExecRequest alloc] initWithRequestId:rconRequestId andCommand:[command dataUsingEncoding:NSASCIIStringEncoding]]];
    NSMutableArray *responsePackets = [[NSMutableArray alloc] init];

    @try {
        while (YES) {
            SCRCONPacket *responsePacket = [rconSocket getReply];
            if ([responsePacket isKindOfClass:[SCRCONAuthResponse class]]) {
                @throw [[SCRCONNoAuthException alloc] init];
            }
            [responsePackets addObject:responsePacket];
        }
    }
    @catch (SCTimeoutException *e) {
        if ([responsePackets count] == 0) {
            @throw;
        }
    }

    SCRCONPacket *packet;
    NSMutableData *response = [NSMutableData data];
    NSEnumerator *packetEnumerator = [responsePackets objectEnumerator];
    while (packet = [packetEnumerator nextObject]) {
        [response appendData:[(SCRCONExecResponse *)packet getResponse]];
    }

    return [[NSString alloc] initWithData:response
                                 encoding:NSASCIIStringEncoding];
}

@end
