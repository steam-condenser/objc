/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import <Foundation/Foundation.h>

@interface SCByteBuffer : NSObject {
@private
    NSMutableData *byteArray;
    NSUInteger     capacity;
    NSUInteger     limit;
    NSInteger      mark;
    NSUInteger     position;
}

+ (SCByteBuffer *)allocate:(NSUInteger)length;
+ (SCByteBuffer *)wrap:(NSData*)byteArray;

- (id)initWithByteArray:(NSData *)byteArray;
- (NSMutableData *)array;
- (SCByteBuffer *)clear;
- (SCByteBuffer *)flip;
- (NSData*)get;
- (NSData*)get:(NSUInteger)length;
- (int8_t)getByte;
- (float)getFloat;
- (int32_t)getLong;
- (int16_t)getShort;
- (NSString *)getString;
- (NSUInteger)getLength;
- (NSUInteger)limit;
- (NSUInteger)position;
- (NSUInteger)remaining;
- (SCByteBuffer *)rewind;
- (void)setLimit:(NSUInteger)newLimit;
- (SCByteBuffer *)put:(NSData *)sourceByteArray;

@end
