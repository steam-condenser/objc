/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCRCONExecRequest.h"


@implementation SCRCONExecRequest

-(id) initWithRequestId:(long) requestId andCommand:(NSData*) rconCommand {
    self = [super initWithRequestId:requestId andHeader:SERVERDATA_EXECCOMMAND andData:rconCommand];
    return self;
}

@end
