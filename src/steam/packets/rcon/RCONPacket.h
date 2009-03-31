/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "SteamPacket.h"

#define SERVERDATA_AUTH 3
#define SERVERDATA_AUTH_RESPONSE 2
#define SERVERDATA_EXECCOMMAND 2
#define SERVERDATA_RESPONSE_VALUE 0


@interface RCONPacket : SteamPacket {
@private
    unsigned long header;
    unsigned long requestId;
}

-(id) initWithRequestId:(unsigned long) requestId andHeader:(unsigned long) rconHeader andData:(NSData*) rconData;
-(NSData*) getData;
-(unsigned long) getRequestId;

@end
