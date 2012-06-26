/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import <sys/select.h>
#import <sys/socket.h>
#import <sys/time.h>

#import "SCSocket.h"
#import "SCException.h"

@implementation SCSocket

- (void)close
{
    close(fdsocket);
}

- (int8_t)getByte
{
    char buffer;
    recv(fdsocket, &buffer, 1, 0);

    return buffer;
}

- (float)getFloat
{
    char buffer[4];
    recv(fdsocket, buffer, 4, 0);

    return *((float *)buffer);
}

- (int32_t)getLong
{
    char buffer[4];
    recv(fdsocket, buffer, 4, 0);

    return *((int32_t*)buffer);
}

- (int16_t)getShort
{
    char buffer[2];
    recv(fdsocket, buffer, 2, 0);

    return *((int16_t *)buffer);
}

- (NSString *)getString
{
    char ch;
    NSMutableString* buffer = [[NSMutableString alloc] init];

    do {
        read(fdsocket, &ch, 1);
        [buffer appendFormat:@"%c", ch];
    } while(ch != '\0');

    return buffer;
}

- (NSData *)recv:(NSUInteger)length
{
    char data[length];

    int bytesRead = recv(fdsocket, data, length, 0);
    if(bytesRead == -1) {
        @throw [[SCException alloc] initWithMessage:[NSString stringWithFormat:@"Could not read from socket: %s", strerror(errno)]];
    }

    return [NSData dataWithBytes:data length:bytesRead];
}

- (BOOL)select
{
    return [self select:0];
}

- (BOOL)select:(NSUInteger)timeout
{
    fd_set read;
    NSInteger selectResult;
    struct timeval timeoutVal;
    timeoutVal.tv_sec = timeout;
    timeoutVal.tv_usec = 0;

    FD_ZERO(&read);
    FD_SET(fdsocket, &read);
    selectResult = select(fdsocket + 1, &read, nil, nil, &timeoutVal);
    if (selectResult == -1) {
        @throw [[SCException alloc] initWithMessage:[NSString stringWithFormat:@"select() failed: %@", strerror(errno)]];
    }

    return (selectResult > 0);
}

- (NSUInteger)send:(NSData *)data
{
    NSUInteger length = [data length];
    uint8_t bytes[length];
    [data getBytes:bytes length:length];

    int sendResult = write(fdsocket, bytes, length);

    if(sendResult == -1) {
        @throw [[SCException alloc] initWithMessage:[NSString stringWithFormat:@"Send failed: %s", strerror(errno)]];
    }

    return sendResult;
}

-(void) setBlock: (BOOL) doBlock {
    isBlocking = doBlock;
}

- (NSUInteger)socket
{
    return fdsocket;
}

@end
