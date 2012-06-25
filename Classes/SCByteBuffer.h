/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import <Foundation/Foundation.h>


@interface SCByteBuffer : NSObject {
@private
    NSMutableData* byteArray;
    int capacity;
    int limit;
    int mark;
    int position;
}

+(SCByteBuffer*) allocate: (int) length;
+(SCByteBuffer*) wrap:(NSData*) byteArray;

-(id) initWithByteArray:(NSData*) byteArray;
-(NSMutableData*) array;
-(SCByteBuffer*) clear;
-(SCByteBuffer*) flip;
-(NSData*) get;
-(NSData*) get:(int) length;
-(char) getByte;
-(float) getFloat;
-(long) getLong;
-(short) getShort;
-(NSString*) getString;
-(int) getLength;
-(int) limit;
-(int) position;
-(int) remaining;
-(SCByteBuffer*) rewind;
-(void) setLimit:(int) newLimit;
-(SCByteBuffer*) put:(NSData*) sourceByteArray;

@end
