//
//  RootViewController.m
//  Saturday_9.13
//
//  Created by qianfeng on 14-9-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
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
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    titleView.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = titleView;
    
    self.title= @"控制首页";
    self.navigationItem.title = @"ControllerOne";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonPress)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(rightButtonPress)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.navigationController.navigationBar.clipsToBounds = YES;
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(20, 30, 44, 44)];
    view.backgroundColor = [UIColor blueColor];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:view];
    //self.navigationItem.rightBarButtonItem = right;
    
    UIImage *image =[UIImage imageNamed:@"user_browse.png"];
    UIImage *colorImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *colorButton = [[UIBarButtonItem alloc]initWithImage:colorImage style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = colorButton;
    
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:nil action:nil];
    
    NSArray *array = @[right,right1,right2];
    self.navigationItem.rightBarButtonItems = array;
    
    //self.navigationItem.leftBarButtonItems = array;
    
  
}
-(void)rightButtonPress
{
   

}
-(void)leftButtonPress
{
    

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];

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
