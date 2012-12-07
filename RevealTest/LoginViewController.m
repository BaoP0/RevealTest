//
//  LoginViewController.m
//  RevealTest
//
//  Created by TianBao Han on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "RevealController.h"
#import "FrontViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize textUsername;
@synthesize textPassword;
@synthesize userLogin;
@synthesize txtKeyChain;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //LogingList
    
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(30, 80, kDeviceWidth-60, 200) style:UITableViewStyleGrouped];
    tableView.backgroundColor=[UIColor clearColor];
    tableView.scrollEnabled=NO;
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
}

- (IBAction)login:(id)sender {

    
    userLogin=[[UserLogin alloc] initWithHostName:@"seller.shikepai.com" customHeaderFields:nil];
    //userLogin=[[UserLogin alloc] init];
    [userLogin username:textUsername.text password:textPassword.text];
   
    FrontViewController *fontView=[[FrontViewController alloc] init];
    [self.navigationController pushViewController:fontView animated:NO];
}


- (IBAction)getKeyChain:(id)sender {
    KeychainItemWrapper *wrapper=[[KeychainItemWrapper alloc]initWithIdentifier:@"skp" accessGroup:@"bao"];
    txtKeyChain.text=[wrapper objectForKey:(__bridge id)kSecAttrAccount];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"loginCell";
    UITableViewCell *cell=(UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (indexPath.row==0) {
            cell.textLabel.textColor=[UIColor orangeColor];
            cell.textLabel.text=@"用户名:";
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            username = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 140, 24)];
            [username setBorderStyle:UITextBorderStyleNone];
            [username setTextColor:[UIColor brownColor]];
            [username setFont:[UIFont fontWithName:@"Arial" size:15]];
            [username setPlaceholder:@"请输入用户名"];
            [username setCenter:cell.center];
            [cell addSubview:username];
            //[username becomeFirstResponder];
            
        }else if(indexPath.row==1) {
            cell.textLabel.textColor=[UIColor orangeColor];
            cell.textLabel.text=@"密    码:";
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            password=[[UITextField alloc]init];
            [password setBounds:CGRectMake(0, 0, 140, 25)];
            //password = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 140, 24)];
            [password setCenter:cell.center];
            [password setBorderStyle:UITextBorderStyleNone];
            [password setPlaceholder:@"请输入密码"];
            [password setTextColor:[UIColor brownColor]];
            [password setFont:[UIFont fontWithName:@"Arial" size:15]];
            [password setReturnKeyType:UIReturnKeyDone];
           // [cell.contentView addSubview:password];
            [cell addSubview:password];
            [password setSecureTextEntry:YES];
            //[password becomeFirstResponder];
        }

    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==1)
    {
        
    }
}

-(void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidUnload
{
    [self setUserLogin:nil];
    [self setTextUsername:nil];
    [self setTextPassword:nil];
    [self setTxtKeyChain:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)PanReveal:(id)sender {
    
    UIPanGestureRecognizer *panGestureRecognizeer=[[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
    sender=panGestureRecognizeer;
    //[self.navigationController.navigationBar addGestureRecognizer:self.navigationBarPanGestrueRecognize];
    
    [self.view addGestureRecognizer:sender];
}
@end
