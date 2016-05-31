//
//  RootTabBarController.m
//  MonDay_9.22
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootTabBarController.h"
#import "HotViewController.h"
#import "SaleViewController.h"
#import "TopicViewController.h"
#import "LimitViewController.h"
#import "FreeViewController.h"
@interface RootTabBarController ()

@end

@implementation RootTabBarController

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
    UINavigationController * hotNavCtrl = [self createNavWithClassString:NSStringFromClass([HotViewController class])];
    UINavigationController * saleNavCtrl = [self createNavWithClassString:NSStringFromClass([SaleViewController class])];
    UINavigationController * topicNavCtrl = [self createNavWithClassString:NSStringFromClass([TopicViewController class])];
    UINavigationController * limitNavCtrl = [self createNavWithClassString:NSStringFromClass([LimitViewController class])];
    UINavigationController * freeNavCtrl = [self createNavWithClassString:NSStringFromClass([FreeViewController class])];
    NSArray * controllers = @[limitNavCtrl,saleNavCtrl,freeNavCtrl,topicNavCtrl,hotNavCtrl];
    self.viewControllers = controllers;
    self.tabBar.barTintColor = [UIColor blackColor];
    
}
-(UINavigationController *)createNavWithClassString:(NSString *)strController
{
    Class  cls = NSClassFromString(strController);
    UIViewController * ctrl = [[[cls class] alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ctrl];
    return nav;
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
