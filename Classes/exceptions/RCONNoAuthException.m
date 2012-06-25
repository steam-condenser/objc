/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONNoAuthException.h"


@implementation RCONNoAuthException

-(id) init {
    self = [super initWithMessage:@"Not authenticated yet."];
    return self;
}

@end
