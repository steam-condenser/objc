/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONTests.h"
#import "SourceServer.h"

@implementation RCONTests

-(void) testSourceShortRCON {
    SourceServer* server = [[SourceServer alloc] initWithHost:@"127.0.0.1"];
    if([server rconAuth:@"test"]) {
        NSLog(@"%@", [server rconExec:@"version"]);
    }
}

@end
