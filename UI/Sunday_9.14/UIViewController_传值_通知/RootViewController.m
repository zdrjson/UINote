//
//  RootViewController.m
//  Sunday_9.14
//
//  Created by qianfeng on 14-9-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "SubViewController.h"
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
    self.view.backgroundColor = [UIColor blueColor];
    [self createButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationReceive:) name:@"SwitchOpenorClose" object:nil];
    
}
-(void)notificationReceive:(NSNotification *)not
{
    NSLog(@"%@",not.userInfo);

}
-(void)createButton
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame =CGRectMake(29, 23, 200, 100);
    [btn setTitle:@"切换到下一个界面" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:25];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

}
-(void)btnPress
{
    SubViewController *sub =[[SubViewController alloc] init];
    sub.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
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
