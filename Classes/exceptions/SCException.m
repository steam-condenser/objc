/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCException.h"

@implementation SCException

- (id)initWithMessage:(NSString *)message
{
    self = [super initWithName:[self className] reason:message userInfo:nil];

    return self;
}

@end
