/** 
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the new BSD License.
 *
 * Copyright (c) 2009-2012, Sebastian Staudt
 */

#define REQUEST_CHALLENGE 0
#define REQUEST_INFO 1
#define REQUEST_PLAYER 2
#define REQUEST_RULES 3

@interface SCGameServer : NSObject {
@protected
    NSDictionary   *infoHash;
    uint16_t        ping;
    NSArray        *playerArray;
    NSHost         *serverHost;
    uint16_t        serverPort;
    NSDictionary   *rulesHash;
}

- (id)initWithHost:(NSHost *)host andPort:(uint16_t)portNumber;

/*-(void)getReply;
-(void)initialize;
-(void)sendRequest;
-(void)updateChallengeNumber;
-(void)updatePing;
-(void)updatePlayerInfo;
-(void)updateRulesInfo;
-(void)updateServerInfo;*/

@end
