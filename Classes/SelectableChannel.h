/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009, Sebastian Staudt
 */

#import "Socket.h"


@interface SelectableChannel : NSObject {
@protected
    Socket* socket;
}

-(Socket*) socket;

@end
