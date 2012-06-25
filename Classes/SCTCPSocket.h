/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCSocket.h"

@interface SCTCPSocket : SCSocket {

}

-(void) connectWithHost:(NSHost*) remoteHost andPort:(unsigned short) remotePort;

@end
