/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "GameServer.h"


@implementation GameServer

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber {
    serverHost = host;
    serverPort = portNumber;
    
    return self;
}

@end
