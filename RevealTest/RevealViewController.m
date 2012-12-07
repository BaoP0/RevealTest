//
//  RevealViewController.m
//  RevealTest
//
//  Created by TianBao Han on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RevealViewController.h"

#import "FrontViewController.h"
#import "RevealController.h"
#import "LoginViewController.h"


@interface RevealViewController ()

@end

@implementation RevealViewController
@synthesize ImageSwitch = _ImageSwitch;

@synthesize realTableView=_realTableView;
@synthesize anotherTable = _anotherTable;
@synthesize cellList;

#pragma marl-UITableVeiw Data Source
-(void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array=[[NSArray alloc] initWithObjects:@"食堂",@"收藏",@"常用地址",@"GPS定位", nil];
    
    
    
    self.cellList=array;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellList.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndetifier];
    }
    
   //cell.textLabel.textColor=[UIColor whiteColor];
	NSInteger row=[indexPath row];
    
    cell.textLabel.text=[self.cellList objectAtIndex:row];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RevealController *revealController=[self.parentViewController isKindOfClass:[RevealController class]]?(RevealController*)self.parentViewController:nil;
    if(indexPath.row==0)
    {
        if(![revealController.frontViewController isKindOfClass:[FrontViewController class]])
        {
            FrontViewController *frontViewController;
            frontViewController=[[FrontViewController alloc]initWithNibName:@"FrontViewController" bundle:nil];
            UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:frontViewController];
            [revealController setFrontViewController:navigationController animated:NO];
        }
    }
    
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)viewDidUnload 
{ 
    [self setRealTableView:nil];
    [self setAnotherTable:nil];
    [self setCellList:nil];
    [self setImageSwitch:nil];
    [super viewDidUnload];
}

- (IBAction)userLogin:(id)sender {
    RevealController *revealController=[self.parentViewController isKindOfClass:[RevealController class]]?(RevealController*)self.parentViewController:nil;
    LoginViewController *loginView;
    loginView=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:loginView];
    [revealController setFrontViewController:navigationController animated:NO];
}
- (IBAction)userRegister:(id)sender {
}
@end
