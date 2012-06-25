/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import <sys/socket.h>
#import <Foundation/Foundation.h>


@interface SCSocket : NSObject {
@protected
    bool isBlocking;
    NSString* readBuffer;
    NSHost* remoteHost;
    int remotePort;
    int fdsocket;
}

-(void) close;
-(char) getByte;
-(float) getFloat;
-(long) getLong;
-(short) getShort;
-(NSString*) getString;
-(NSData*) recv: (int) length;
-(bool) select;
-(bool) select: (int) timeout;
-(int) send: (NSData*) data;
-(void) setBlock: (bool) doBlock;
-(int) socket;

@end
