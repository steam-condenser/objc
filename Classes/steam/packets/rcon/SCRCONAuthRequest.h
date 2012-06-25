/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONPacket.h"


@interface SCRCONAuthRequest : SCRCONPacket {

}

-(id) initWithRequestId:(long) request withPassword:(NSData*) password;

@end
