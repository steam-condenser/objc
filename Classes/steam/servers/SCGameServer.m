/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCGameServer.h"


@implementation SCGameServer

-(id) initWithHost:(NSHost*) host andPort:(int) portNumber {
    serverHost = host;
    serverPort = portNumber;
    
    return self;
}

@end
