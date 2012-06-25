/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCTimeoutException.h"


@implementation SCTimeoutException

-(id) init {
    self = [super initWithMessage:@"Operation timed out."];
    return self;
}

@end
