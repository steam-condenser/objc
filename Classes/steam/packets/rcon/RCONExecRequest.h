/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "RCONPacket.h"


@interface RCONExecRequest : RCONPacket {

}

-(id) initWithRequestId:(long) requestId andCommand:(NSData*) command;

@end
