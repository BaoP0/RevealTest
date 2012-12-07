//
//  YahooEngine.m
//  RevealTest
//
//  Created by TianBao Han on 12-11-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "YahooEngine.h"

#define YAHOO_URL(__C1__, __C2__) [NSString stringWithFormat:@"d/quotes.csv?e=.csv&f=sl1d1t1&s=%@%@=X", __C1__, __C2__]
@implementation YahooEngine

-(MKNetworkOperation*)currencyRateFor:(NSString *)sourceCurrency inCurrency:(NSString *)targetCurrency onCompletaion:(CurrencyResponseBlock)completionBlock onError:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *op=[self operationWithPath:YAHOO_URL(sourceCurrency, targetCurrency) params:nil httpMethod:@"GET"];
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         DLog(@"%@",[completedOperation responseString]);
         completionBlock(5.0f);
     }onError:^(NSError *error) {
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}

@end
