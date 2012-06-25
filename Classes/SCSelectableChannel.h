/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#import "SCSocket.h"


@interface SCSelectableChannel : NSObject {
@protected
    SCSocket* socket;
}

-(SCSocket*) socket;

@end
