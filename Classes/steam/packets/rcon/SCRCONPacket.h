/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCSteamPacket.h"

#define SERVERDATA_AUTH 3
#define SERVERDATA_AUTH_RESPONSE 2
#define SERVERDATA_EXECCOMMAND 2
#define SERVERDATA_RESPONSE_VALUE 0


@interface SCRCONPacket : SCSteamPacket {
@private
    unsigned long header;
    unsigned long requestId;
}

-(id) initWithRequestId:(unsigned long) requestId andHeader:(unsigned long) rconHeader andData:(NSData*) rconData;
-(NSData*) getData;
-(unsigned long) getRequestId;

@end
