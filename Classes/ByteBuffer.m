/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "BufferUnderflowException.h"
#import "ByteBuffer.h"


@implementation ByteBuffer

+(ByteBuffer*) allocate:(int) length {
    return [[ByteBuffer alloc] initWithByteArray:[NSMutableData dataWithLength:length]];
}

+(ByteBuffer*) wrap:(NSData*) aByteArray {
    return [[ByteBuffer alloc] initWithByteArray:aByteArray];
}
            
-(id) initWithByteArray:(NSData*) aByteArray {        
    byteArray = [NSMutableData dataWithData:aByteArray];
    capacity = [byteArray length];
    limit = capacity;
    position = 0;
    mark = -1;
    
    return self;
}

-(NSMutableData*) array {
    return byteArray;
}
    
-(ByteBuffer*) clear {
    limit = capacity;
    position = 0;
    mark = -1;
    
    return self;
}

-(ByteBuffer*) flip {
    limit = position;
    position = 0;
    mark = -1;
    
    return self;
}

-(NSData*) get {
    return [self get:0];
}

-(NSData*) get:(int) length
{
    if(length == 0)
    {
        length = limit - position;
    }
    else if(length > [self remaining])
    {
        @throw [[BufferUnderflowException alloc] init];
    }
    
    NSRange range = {position, length};
    NSData* data = [byteArray subdataWithRange:range];
    position += length;
    
    return data;
}

-(char) getByte {
    unsigned char bytes[1];
    [[self get:1] getBytes:bytes length:1];
    return bytes[0];
}

-(float) getFloat {
    unsigned char bytes[4];
    [[self get:4] getBytes:bytes length:4];
    return *((float*) bytes);
}

-(long) getLong {
    unsigned char bytes[4];
    [[self get:4] getBytes:bytes length:4];
    return *((long*) bytes);
}

-(short) getShort {
    unsigned char bytes[2];
    [[self get:2] getBytes:bytes length:2];
    return *((short*) bytes);
}

-(NSString*) getString {
    NSRange searchRange = {position, limit - position};
    NSRange zeroByteRange = [[[NSString alloc] initWithData:byteArray encoding:NSASCIIStringEncoding] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"\0"] options:NSLiteralSearch range:searchRange];
    if(zeroByteRange.location == NSNotFound)
    {
        return @"";
    }
    else
    {
        NSRange stringRange = {position, zeroByteRange.location - position};
        NSString* dataString = [[NSString alloc] initWithData:[byteArray subdataWithRange:stringRange] encoding:NSASCIIStringEncoding];
        position += stringRange.length + 1;
        return dataString;
    }
}

-(int) getLength {
    return [byteArray length];
}

-(int) limit {
    return limit;
}

-(int) position {
    return position;
}

-(int) remaining {
    return limit - position;
}

-(ByteBuffer*) rewind {
    position = 0;
    mark = -1;
    
    return self;
}

-(void) setLimit:(int) newLimit {
    limit = newLimit;
}

-(ByteBuffer*) put:(NSData*) sourceByteArray {
    int newPosition = MIN([sourceByteArray length], [self remaining]);
    NSRange range = {position, newPosition};
    [byteArray replaceBytesInRange:range withBytes:[sourceByteArray bytes]];
    position = newPosition;
    
    return self;
}
        

@end
