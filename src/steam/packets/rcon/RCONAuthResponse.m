/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONAuthResponse.h"


@implementation RCONAuthResponse

-(id) initWithRequestId:(long) requestId {
    self = [super initWithRequestId:requestId andHeader:SERVERDATA_AUTH_RESPONSE andData:[NSData data]];
    return self;
}

@end
