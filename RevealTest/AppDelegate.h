//
//  AppDelegate.h
//  RevealTest
//
//  Created by TianBao Han on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RevealController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(retain,nonatomic) RevealController *viewController;
@end
