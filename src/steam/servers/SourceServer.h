/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "GameServer.h"
#import "RCONSocket.h"

@interface SourceServer : GameServer {
@private
    int rconRequestId; 
    RCONSocket* rconSocket;
//    SourceSocket* socket;
}

-(id) initWithHost:(NSHost*) host;
-(id) initWithHost:(NSHost*) host andPort:(int) portNumber;
-(bool) rconAuth:(NSString*) password;
-(NSString*) rconExec:(NSString*) command;

@end