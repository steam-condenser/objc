/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONExecResponse.h"


@implementation RCONExecResponse

-(id) initWithRequestId:(long) requestId andCommandReturn:(NSData*) commandReturn {
    self = [super initWithRequestId:requestId andHeader:SERVERDATA_RESPONSE_VALUE andData:commandReturn];
    return self;
}

-(NSData*) getResponse {
    return [contentData array];
}

@end
