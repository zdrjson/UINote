//
//  ThirdViewController.m
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ThirdViewController.h"
#define DEFINE_UITabBarItem(UITabBarSystemItem,kItemTag,__titleName__)  UITabBarItem * item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItem tag:kItemTag];\
self.tabBarItem = item;\
self.title = __titleName__
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        DEFINE_UITabBarItem(UITabBarSystemItemHistory,0,@"最近观看");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
