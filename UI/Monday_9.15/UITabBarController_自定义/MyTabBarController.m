//
//  MyTabBarController.m
//  Monday_9.15
//
//  Created by qianfeng on 14-9-16.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

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
    [self createTabBarControllers];
}
-(void)createTabBarControllers
{
    FirstViewController *firstVC = [[FirstViewController alloc ]init];
    UINavigationController *firstNavCtrl = [[UINavigationController alloc]initWithRootViewController:firstVC];
    
    SecondViewController *secondVC =[[SecondViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    NSArray * controllers =@[firstNavCtrl,secondVC,thirdVC];
    self.viewControllers = controllers;

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
