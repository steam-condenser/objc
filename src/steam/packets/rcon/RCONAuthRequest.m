/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONAuthRequest.h"
#import "RCONPacket.h"

@implementation RCONAuthRequest

-(id) initWithRequestId:(long) aRequestId withPassword:(NSData*) aPassword
{
    self = [super initWithRequestId:aRequestId andHeader:SERVERDATA_AUTH andData:aPassword];
    return self;
}

@end
