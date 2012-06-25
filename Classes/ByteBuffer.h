/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import <Foundation/Foundation.h>


@interface ByteBuffer : NSObject {
@private
    NSMutableData* byteArray;
    int capacity;
    int limit;
    int mark;
    int position;
}

+(ByteBuffer*) allocate: (int) length;
+(ByteBuffer*) wrap:(NSData*) byteArray;

-(id) initWithByteArray:(NSData*) byteArray;
-(NSMutableData*) array;
-(ByteBuffer*) clear;
-(ByteBuffer*) flip;
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
-(ByteBuffer*) rewind;
-(void) setLimit:(int) newLimit;
-(ByteBuffer*) put:(NSData*) sourceByteArray;

@end
