/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONExecResponse.h"

@implementation SCRCONExecResponse

- (id)initWithRequestId:(uint32_t)requestId
       andCommandReturn:(NSData *)commandReturn
{
    self = [super initWithRequestId:requestId
                          andHeader:SERVERDATA_RESPONSE_VALUE
                            andData:commandReturn];

    return self;
}

- (NSData *)getResponse
{
    return [contentData array];
}

@end
