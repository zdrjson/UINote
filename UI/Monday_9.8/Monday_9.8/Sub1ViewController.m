//
//  Sub1ViewController.m
//  Monday_9.8
//
//  Created by qianfeng on 14-9-8.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "Sub1ViewController.h"
#import  "SubViewController.h"
@interface Sub1ViewController ()

@end

@implementation Sub1ViewController

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
    self.view.backgroundColor =[UIColor greenColor];
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor=[UIColor orangeColor];
    [btn setTitle:@"切换" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
-(void)pressBtn
{
    SubViewController*root =[[SubViewController alloc]init];
    root.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:root animated:YES completion:nil];

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
