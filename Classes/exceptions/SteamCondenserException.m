/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "SteamCondenserException.h"


@implementation SteamCondenserException

-(id) initWithMessage: (NSString*) message {
    return [super initWithName: [self className] reason: message userInfo: nil];
}

@end
