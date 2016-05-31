//
//  RootViewController.m
//  Saturday_9.13
//
//  Created by qianfeng on 14-9-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor redColor];
    
    self.navigationController.toolbarHidden = NO;
    
    self.navigationController.toolbar.translucent = YES;
//    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 380, 100, 100)];
//    view.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:view];
    self.navigationController.toolbar.barTintColor = [UIColor blackColor];
    
    self.navigationController.toolbar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@"user_download.png"] forToolbarPosition: UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
    UIImage * image = [UIImage imageNamed:@"user_download.png"];
    UIImage * colorImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * colorbtn = [[UIBarButtonItem alloc] initWithImage:colorImage style:UIBarButtonItemStyleDone target:nil action:nil];
   
    
    
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:nil action:nil];
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:nil];
    
    UIBarButtonItem *btn2 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
    
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:nil action:nil];
    
    UIBarButtonItem *btn4 =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil];
    
    UIBarButtonItem *btn5 =[[UIBarButtonItem alloc] initWithTitle:@"Apple" style:UIBarButtonItemStyleDone target:nil action:nil];
    UIBarButtonItem *spaceButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    spaceButton.width = 30;
    NSArray *array = @[spaceButton,btn,btn1,btn2,btn3,btn4,btn5];
    self.toolbarItems = array;
    
    UIBarButtonItem *flexSpace =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *array1 = @[flexSpace,btn,flexSpace,btn1,flexSpace,btn2,flexSpace,btn3,flexSpace,btn4,flexSpace,btn5,flexSpace,colorbtn];
    
    self.toolbarItems = array1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
