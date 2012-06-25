/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>

#import "RCONTests.h"
#import "SourceServer.h"

int main(int argc, char** argv) {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    /*[SenTestObserver class];    
    SenTestSuite *suite= [SenTestSuite testSuiteForTestCaseClass:[RCONTests class]];
    [suite run];*/
    
    SourceServer* server = [[SourceServer alloc] initWithHost:[NSHost hostWithName:@"localhost"]];
    if([server rconAuth:@"test"]) {
        NSLog(@"%@", [server rconExec:@"version"]);
    }
    
    [pool release];
    return 0;
}
