//
//  YahooEngine.h
//  RevealTest
//
//  Created by TianBao Han on 12-11-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface YahooEngine : MKNetworkEngine

typedef void(^CurrencyResponseBlock)(double rate);

-(MKNetworkOperation*)currencyRateFor:(NSString*)sourceCurrency inCurrency:(NSString*) targetCurrency onCompletaion:(CurrencyResponseBlock) completionBlock onError:(MKNKErrorBlock) errorBlock;
@end
