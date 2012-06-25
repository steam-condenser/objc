/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONAuthRequest.h"
#import "RCONAuthResponse.h"
#import "RCONExecRequest.h"
#import "RCONExecResponse.h"
#import "RCONNoAuthException.h"
#import "RCONPacket.h"
#import "SourceServer.h"
#import "TimeoutException.h"


@implementation SourceServer

-(id) initWithHost:(NSHost*) host {
    return [self initWithHost:host andPort:27015];
}

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber {
    self = [super initWithHost:host andPort:portNumber];
    rconSocket = [[RCONSocket alloc] initWithHost:host andPort:portNumber];
    //socket = [[SourceSocket alloc] init:ipAddress:portNumber];
    
    return self;
}

-(bool) rconAuth:(NSString*) password {
    long seed;
    time(&seed);
    srandom(seed);
    rconRequestId = random();
    
    [rconSocket send:[[RCONAuthRequest alloc] initWithRequestId:rconRequestId withPassword:[password dataUsingEncoding:NSASCIIStringEncoding]]];
    [rconSocket getReply];
    RCONPacket* reply = [rconSocket getReply];
    
    unsigned long mirroredRequestId = [reply getRequestId];
    
    return (mirroredRequestId == rconRequestId);
}

-(NSString*) rconExec:(NSString*) command {
    [rconSocket send: [[RCONExecRequest alloc] initWithRequestId:rconRequestId andCommand:[command dataUsingEncoding:NSASCIIStringEncoding]]];
    NSMutableArray* responsePackets = [[NSMutableArray alloc] init];
    
    @try {
        while(true) {
            RCONPacket* responsePacket = [rconSocket getReply];
            if([responsePacket isKindOfClass: [RCONAuthResponse class]]) {
                @throw [[RCONNoAuthException alloc] init];
            }
            [responsePackets addObject:responsePacket];
        }
    }
    @catch(TimeoutException* e) {
        if([responsePackets count] == 0) {
            @throw;
        }
    }
    
    RCONPacket* packet;
    NSMutableData* response = [NSMutableData data];
    NSEnumerator* packetEnumerator = [responsePackets objectEnumerator];
    while(packet = [packetEnumerator nextObject]) {
        [response appendData:[(RCONExecResponse*) packet getResponse]];
    }
    
    return [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
}

@end
