//
//  LoginViewController.h
//  RevealTest
//
//  Created by TianBao Han on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKNetworkKit.h"
#import "UserLogin.h"

@interface LoginViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITextField *username;
    UITextField *password;
}

@property (strong, nonatomic) IBOutlet UITextField *textUsername;
@property (strong, nonatomic) IBOutlet UITextField *textPassword;
@property(strong,nonatomic) UserLogin *userLogin;
@property (strong, nonatomic) IBOutlet UILabel *txtKeyChain;

- (IBAction)login:(id)sender;
- (IBAction)PanReveal:(id)sender;
- (IBAction)getKeyChain:(id)sender;
@end
