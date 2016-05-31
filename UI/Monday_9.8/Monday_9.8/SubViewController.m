//
//  SubViewController.m
//  Monday_9.8
//
//  Created by qianfeng on 14-9-8.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "SubViewController.h"
#import "Sub1ViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)loadView
{
    [super loadView];
    NSLog(@"subViewController:%@",NSStringFromSelector(_cmd));

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame =CGRectMake(50, 40, 120, 200);
    [btn setTitle:@"切换" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor blueColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)pressBtn
{
    Sub1ViewController *sub1 =[[Sub1ViewController alloc]init];
    sub1.modalTransitionStyle =UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:sub1 animated:YES completion:nil];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"subViewController:%@",NSStringFromSelector(_cmd));
    

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"subViewController:%@",NSStringFromSelector(_cmd));

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"subViewController:%@",NSStringFromSelector(_cmd));

}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"subViewController:%@",NSStringFromSelector(_cmd));
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
