/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCBufferUnderflowException.h"
#import "SCByteBuffer.h"

@implementation SCByteBuffer

+ (SCByteBuffer *)allocate:(NSUInteger)length
{
    return [[SCByteBuffer alloc] initWithByteArray:[NSMutableData dataWithLength:length]];
}

+ (SCByteBuffer *)wrap:(NSData *)aByteArray
{
    return [[SCByteBuffer alloc] initWithByteArray:aByteArray];
}
            
- (id)initWithByteArray:(NSData *)aByteArray
{
    self = [super init];

    byteArray = [NSMutableData dataWithData:aByteArray];
    capacity = [byteArray length];
    limit = capacity;
    position = 0;
    mark = -1;

    return self;
}

- (NSMutableData *)array
{
    return byteArray;
}
    
- (SCByteBuffer *)clear
{
    limit = capacity;
    position = 0;
    mark = -1;

    return self;
}

- (SCByteBuffer*) flip
{
    limit = position;
    position = 0;
    mark = -1;
    
    return self;
}

- (NSData *)get
{
    return [self get:0];
}

-(NSData *)get:(NSUInteger)length
{
    if (length == 0) {
        length = limit - position;
    } else if (length > [self remaining]) {
        @throw [[SCBufferUnderflowException alloc] init];
    }
    
    NSRange range = { position, length };
    NSData *data = [byteArray subdataWithRange:range];
    position += length;

    return data;
}

- (int8_t)getByte
{
    int8_t bytes[1];
    [[self get:1] getBytes:bytes length:1];

    return bytes[0];
}

- (float) getFloat
{
    int8_t bytes[4];
    [[self get:4] getBytes:bytes length:4];

    return *((float *)bytes);
}

- (int32_t) getLong {
    int8_t bytes[4];
    [[self get:4] getBytes:bytes length:4];

    return *((int32_t *)bytes);
}

- (int16_t) getShort
{
    int8_t bytes[2];
    [[self get:2] getBytes:bytes length:2];

    return *((int16_t *)bytes);
}

-(NSString*) getString
{
    NSRange searchRange = { position, limit - position };
    NSRange zeroByteRange = [[[NSString alloc] initWithData:byteArray
                                                   encoding:NSASCIIStringEncoding] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"\0"] options:NSLiteralSearch range:searchRange];
    if (zeroByteRange.location == NSNotFound) {
        return @"";
    } else {
        NSRange stringRange = {position, zeroByteRange.location - position};
        NSString* dataString = [[NSString alloc] initWithData:[byteArray subdataWithRange:stringRange]
                                                     encoding:NSASCIIStringEncoding];
        position += stringRange.length + 1;
        return dataString;
    }
}

- (NSUInteger)getLength
{
    return [byteArray length];
}

- (NSUInteger)limit
{
    return limit;
}

- (NSUInteger)position
{
    return position;
}

- (NSUInteger)remaining
{
    return limit - position;
}

- (SCByteBuffer *)rewind
{
    position = 0;
    mark = -1;

    return self;
}

- (void)setLimit:(NSUInteger)newLimit
{
    limit = newLimit;
}

- (SCByteBuffer *)put:(NSData *)sourceByteArray
{
    NSUInteger newPosition = MIN([sourceByteArray length], [self remaining]);
    NSRange range = { position, newPosition };
    [byteArray replaceBytesInRange:range withBytes:[sourceByteArray bytes]];
    position = newPosition;

    return self;
}
        

@end
