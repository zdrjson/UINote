//
//  MyTabBarController.m
//  Sunday3_9.21
//
//  Created by qianfeng on 14-9-21.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
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
    [self createSubViewControllers];
    [self createCustomTabBar];
    
}
-(void)createCustomTabBar
{
    self.tabBar.hidden = YES;
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbg"]];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(0, 480-49, 320, 49);
    imageView.tag = 1001;
    [self.view addSubview:imageView];
    for (int i = 0; i<4; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_%d",i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_c%d",i]] forState:UIControlStateSelected];
        btn.frame = CGRectMake(40+i*70, (49-30)/2, 30, 30);
        btn.tag = 101+i;
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:btn];
        if (i==0) {
            btn.selected = YES;
        }
    }
    UIView * indicatiorView = [[UIView alloc] initWithFrame:CGRectMake(40, 30+(49-30)/2, 30, (49-30)/6)];
    indicatiorView.backgroundColor = [UIColor magentaColor];
    indicatiorView.tag = 201;
    [imageView addSubview:indicatiorView];
    
}
-(void)btnPress:(UIButton *)btn
{
    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:1001];
    for (int i = 0; i<4; i++) {
        UIButton * btnTemp = (UIButton *)[imageView  viewWithTag:101+i];
        btnTemp.selected = NO;
    }
    btn.selected=YES;
    //设置当前被选中的视图控制器
    self.selectedIndex = btn.tag - 101;
    
    UIView * indicatiorView = [imageView viewWithTag:201];
    CGRect rect = indicatiorView.frame;
    
    rect.origin.x= 40+(btn.tag-101)*70;
    indicatiorView.frame = rect;
    
}
-(void)createSubViewControllers
{
    FirstViewController * firstVC = [[FirstViewController alloc] init];
    UINavigationController * firstNavCtrl = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    SecondViewController * secondVC = [[SecondViewController alloc] init];
    
    ThirdViewController * thirdVC = [[ThirdViewController alloc] init];
    
    FourthViewController * fourthVC = [[FourthViewController alloc] init];
    
   
    NSArray * array = @[firstNavCtrl,secondVC,thirdVC,fourthVC];
    self.viewControllers= array;
   
    
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
