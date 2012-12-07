//
//  UserLogin.h
//  RevealTest
//
//  Created by TianBao Han on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "KeychainItemWrapper.h"
@interface UserLogin : MKNetworkEngine

-(MKNetworkOperation*)username:(NSString *)username password:(NSString *)password;

@end
