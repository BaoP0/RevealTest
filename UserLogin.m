//
//  UserLogin.m
//  RevealTest
//
//  Created by TianBao Han on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserLogin.h"
#import "NSDictionary+RequestEncoding.h"



@implementation UserLogin

-(MKNetworkOperation*)username:(NSString *)username password:(NSString *)password
{
    NSMutableDictionary *loginDic=[NSMutableDictionary dictionaryWithObjectsAndKeys:username,@"username",password,@"password", nil ];
    NSString *loginStr=[NSString stringWithFormat:@"ios.php?act=login&username=%@&password=%@",username,password];
    MKNetworkOperation *op=[self operationWithPath:loginStr params:loginDic httpMethod:@"GET"];
    [op setUsername:username password:password];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSString *responString=[completedOperation responseString];
        NSError *jsonError=nil;
        NSDictionary *dictionary=[NSJSONSerialization JSONObjectWithData:[completedOperation responseData] options:0 error:&jsonError];
         
        NSString *jsonStr=[dictionary objectForKey:@"status"];

        if ([jsonStr isEqualToString:@"ok"]) {
            DLog(@"OK");
            
            KeychainItemWrapper *wrapper=[[KeychainItemWrapper alloc]initWithIdentifier:@"skp" accessGroup:@"bao"];
            [wrapper setObject:username forKey:(__bridge id)kSecAttrAccount];
            DLog(@"usernameKeyChain:%@",[wrapper objectForKey:(__bridge id)kSecAttrAccount]);
            
        }
        DLog(@"Done%@",responString);
    } onError:^(NSError *error) {
        DLog(@"failed:%@",error);
    }];
    [self enqueueOperation:op];
    return op;
}

@end
