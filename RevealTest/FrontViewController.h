//
//  FrontViewController.h
//  RevealTest
//
//  Created by TianBao Han on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ZUUIRevealController.h"

@interface FrontViewController : UIViewController<UIWebViewDelegate>
@property(strong,nonatomic) IBOutlet UIWebView *webView;

@end
