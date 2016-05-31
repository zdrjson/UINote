//
//  CustomTabBarController.m
//  Sunday_9.28
//
//  Created by qianfeng on 14-9-28.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "CustomTabBarController.h"
#import "ListViewController.h"
#import "SubjectViewController.h"
#import "TabBarItem.h"
@interface CustomTabBarController ()
{
    UIImageView * _tabBar;
}
@end

@implementation CustomTabBarController

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
    //1:隐藏系统自带的标签栏
    self.tabBar.hidden = YES;
    //2:添加一个自定义的View
    [self createTabBar];
    //3:添加按钮（标签）
    [self createTabbarItem];
    //4:设置视图控制器数组
    [self createViewControllers];
}
-(void)createViewControllers
{
    NSMutableArray * vcs = [[NSMutableArray alloc] init];
    for (int i = 0; i<5; i++) {
        UIViewController * vc = i==3?[[SubjectViewController alloc] init]:[[ListViewController alloc] initWithType:i];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcs addObject:navi];
    }
    self.viewControllers = vcs;
    
}
-(void)createTabbarItem
{
    NSArray * titleArr = @[@"限免",@"降价",@"免费",@"专题",@"热榜"];
    NSArray * imageArr = @[@"tabbar_limitfree",
                           @"tabbar_reduceprice",
                           @"tabbar_appfree",
                           @"tabbar_subject",
                           @"tabbar_rank"];
    NSArray * imageSelectArr = @[@"tabbar_limitfree_press",
                                 @"tabbar_reduceprice_press",
                                 @"tabbar_appfree_press",
                                 @"tabbar_subject_press",
                                 @"tabbar_rank_press"];
    CGFloat buttonWidth = [[UIScreen mainScreen]bounds].size.width/titleArr.count;
    for (int i = 0; i<titleArr.count; i++) {
        TabBarItem * item = [[TabBarItem alloc] initWithFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, 49)];
        
        [item setTitle:titleArr[i] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:imageSelectArr[i]] forState:UIControlStateSelected];
        if (i==0) {
            item.selected = YES;
        }
        item.tag = 100+i;
        [item addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBar addSubview:item];
    }
    
}
-(void)selectItem:(UIButton *)btn
{
    for (UIButton * b in _tabBar.subviews) {
        b.selected = NO;
    }
    btn.selected = YES;
    self.selectedIndex = btn.tag - 100;

}
-(void)createTabBar
{
    _tabBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height-49, [[UIScreen mainScreen]bounds].size.width, 49)];
    _tabBar.image = [UIImage imageNamed:@"tabbar_bg"];
    _tabBar.userInteractionEnabled = YES;
    [self.view addSubview:_tabBar];
    _tabBar.alpha = 0.8;
    
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
