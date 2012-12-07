//
//  RevealViewController.h
//  RevealTest
//
//  Created by TianBao Han on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RevealViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) IBOutlet UITableView *realTableView;
@property (strong, nonatomic) IBOutlet UITableView *anotherTable;
@property(strong,nonatomic)NSArray *cellList;

- (IBAction)userLogin:(id)sender;
- (IBAction)userRegister:(id)sender;


@property (strong, nonatomic) IBOutlet UISwitch *ImageSwitch;

@end
