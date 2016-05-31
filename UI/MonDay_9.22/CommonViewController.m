//
//  CommonViewController.m
//  MonDay_9.22
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()

@end

@implementation CommonViewController

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
}
-(void)createTabBarItemWithTitle:(NSString *)title Image:(UIImage *)image SelectedImage:(UIImage *)selectedimage
{
    UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedimage];
    self.tabBarItem = item;
}
-(void)setTitle:(NSString *)title
{
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    lable.text = title;
    lable.font = [UIFont systemFontOfSize:20];
    lable.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = lable;
    
    
}
-(void)createLeftBarButtonItemWithTitle:(NSString *)tilte ItemStyle:(UIBarButtonItemStyle )itemStyle Target:(id)target  action:(SEL)sel
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:tilte style:itemStyle target:target action:sel];
    self.navigationItem.leftBarButtonItem = item;

}

-(void)createRightBarButtonItemWithTitle:(NSString *)tilte ItemStyle:(UIBarButtonItemStyle)itemStyle Target:(id)target action:(SEL)sel
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:tilte style:itemStyle target:target action:sel];
    self.navigationItem.rightBarButtonItem = item;
    
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
