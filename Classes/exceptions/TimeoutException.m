/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "TimeoutException.h"


@implementation TimeoutException

-(id) init {
    self = [super initWithMessage:@"Operation timed out."];
    return self;
}

@end
