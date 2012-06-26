/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONAuthResponse.h"

@implementation SCRCONAuthResponse

- (id)initWithRequestId:(uint32_t)requestId
{
    self = [super initWithRequestId:requestId
                          andHeader:SERVERDATA_AUTH_RESPONSE
                            andData:[NSData data]];

    return self;
}

@end
