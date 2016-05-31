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
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(20, 40, 200, 50);
    [btn setTitle:@"切换到下一页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)btnPress
{
    
    SubViewController *sub =[[SubViewController alloc] init];
    sub.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    sub.delegate = self;
    [self presentViewController:sub animated:YES completion:nil];


}
-(void)changecolor:(UIColor *)color
{
    self.view.backgroundColor = color;

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
