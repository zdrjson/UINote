//
//  ViewController.m
//  Thursday_10.16
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "V1ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createButton];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme:) name:@"changeTheme" object:nil];
}
-(void)createButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(60, 60, 60, 60);
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
}
-(void)changeTheme:(NSNotification *)not
{
    self.view.backgroundColor = not.userInfo[@"Color"];
    self.title= not.userInfo[@"Title"];
}
-(void)btnClick
{
    V1ViewController * v1 = [[V1ViewController alloc] init];
    [self.navigationController pushViewController:v1 animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
