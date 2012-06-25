/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONAuthRequest.h"
#import "SCRCONPacket.h"

@implementation SCRCONAuthRequest

-(id) initWithRequestId:(long) aRequestId withPassword:(NSData*) aPassword
{
    self = [super initWithRequestId:aRequestId andHeader:SERVERDATA_AUTH andData:aPassword];
    return self;
}

@end
