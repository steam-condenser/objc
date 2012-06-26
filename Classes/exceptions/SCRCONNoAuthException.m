/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONNoAuthException.h"

@implementation SCRCONNoAuthException

- (id)init
{
    self = [super initWithMessage:@"Not authenticated yet."];

    return self;
}

@end
