//
//  RootViewController.m
//  Thursday_10.2_1
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "SubViewController.h"
@interface RootViewController ()
{
    UILabel * _label;
}
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
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    _label.text = @"首页";
    _label.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:_label];
    _label.textAlignment = NSTextAlignmentCenter;
    self.view.backgroundColor = [UIColor grayColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleChanged:) name:@"OpenOrClose" object:nil];
}
-(void)titleChanged:(NSNotification *)not
{
    NSLog(@"%@",not.userInfo);
    _label.text = [not.userInfo objectForKey:@"ON"];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SubViewController * sub = [[SubViewController alloc] init];
    sub.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:sub animated:YES completion:nil];
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
