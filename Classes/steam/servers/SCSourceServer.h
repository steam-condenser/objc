/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCGameServer.h"
#import "SCRCONSocket.h"

@interface SCSourceServer : SCGameServer {
@private
    int rconRequestId; 
    SCRCONSocket* rconSocket;
//    SourceSocket* socket;
}

-(id) initWithHost:(NSHost*) host;
-(id) initWithHost:(NSHost*) host andPort:(int) portNumber;
-(bool) rconAuth:(NSString*) password;
-(NSString*) rconExec:(NSString*) command;

@end