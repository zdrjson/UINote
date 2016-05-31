//
//  RootViewController.m
//  Monday_9.8
//
//  Created by qianfeng on 14-9-8.
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
-(void)loadView
{
    [super loadView];
    NSLog(@"RootViewController :%@",NSStringFromSelector(_cmd));

}
- (void)viewDidLoad
{
    [super viewDidLoad];
     NSLog(@"RootViewController :%@",NSStringFromSelector(_cmd));
    // Do any additional setup after loading the view.
       self.view.backgroundColor=[UIColor cyanColor];
    UIButton   * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(20, 300, 200, 100);
    btn.backgroundColor=[UIColor magentaColor];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)pressBtn
{
    SubViewController * sub = [[SubViewController alloc]init];
    sub.modalTransitionStyle = UIModalTransitionStyleCoverVertical;//defaut 由下往上
    sub.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;//翻转
//    sub.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;//渐变
//    sub.modalTransitionStyle = UIModalTransitionStylePartialCurl;//翻页
    
    [self presentViewController:sub animated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    NSLog(@"RootViewController :%@",NSStringFromSelector(_cmd));

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"RootViewController :%@",NSStringFromSelector(_cmd));
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"RootViewController :%@",NSStringFromSelector(_cmd));

}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"RootViewController :%@",NSStringFromSelector(_cmd));

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
