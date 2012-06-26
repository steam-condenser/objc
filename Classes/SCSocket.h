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
    BOOL       isBlocking;
    NSString  *readBuffer;
    NSHost    *remoteHost;
    uint16_t   remotePort;
    NSInteger  fdsocket;
}

- (void)close;
- (NSData *)recv:(NSUInteger)length;
- (BOOL)select;
- (BOOL)select:(NSUInteger)timeout;
- (NSUInteger)send:(NSData *)data;
- (void)setBlock:(BOOL)doBlock;
- (NSUInteger)socket;

@end
