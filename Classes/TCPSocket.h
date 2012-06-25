/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "Socket.h"

@interface TCPSocket : Socket {

}

-(void) connectWithHost:(NSHost*) remoteHost andPort:(unsigned short) remotePort;

@end
