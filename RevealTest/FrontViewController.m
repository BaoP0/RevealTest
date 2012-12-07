//
//  FrontViewController.m
//  RevealTest
//
//  Created by TianBao Han on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FrontViewController.h"


@interface FrontViewController ()

@property(retain,nonatomic)UIPanGestureRecognizer *navigationBarPanGestrueRecognize;

@end

@implementation FrontViewController
@synthesize webView=_webView;
@synthesize navigationBarPanGestrueRecognize=_navigationBarPanGestrueRecognize;
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
    NSString *urlString=[[NSString alloc] initWithFormat:@"http://seller.shikepai.com"];
    NSURL *url=[[NSURL alloc] initWithString:urlString];
    _webView.delegate=self;
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title=NSLocalizedString(@"Front View", @"FrontView");
    if([self.navigationController.parentViewController respondsToSelector:@selector(revealGesture:)]&&[self.navigationController.parentViewController respondsToSelector:@selector(revealToggle:)])
    {
        if(![[self.navigationController.navigationBar gestureRecognizers] containsObject:self.navigationBarPanGestrueRecognize])
        {
            UIPanGestureRecognizer *panGestureRecognizeer=[[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
            
            self.navigationBarPanGestrueRecognize=panGestureRecognizeer;
            //[self.navigationController.navigationBar addGestureRecognizer:self.navigationBarPanGestrueRecognize];
            
            [self.view addGestureRecognizer:self.navigationBarPanGestrueRecognize];
        }
        if(![self.navigationItem leftBarButtonItem])
        {
            UIBarButtonItem *revealButton=[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Reveal", @"Reveal") style:UIBarButtonItemStylePlain target:self.navigationController.parentViewController action:@selector(revealToggle:)];
            
            self.navigationItem.leftBarButtonItem=revealButton;
        }
        
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"start");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSURLRequest *request= [webView request];
    NSURL *url=[request URL];
    NSLog(@"%@",url);
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    [self setNavigationBarPanGestrueRecognize:nil];
    [self setWebView:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
