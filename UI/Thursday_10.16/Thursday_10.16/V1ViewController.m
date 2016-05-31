//
//  V1ViewController.m
//  Thursday_10.16
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "V1ViewController.h"
#import "V2ViewController.h"
@interface V1ViewController ()

@end

@implementation V1ViewController

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
    [self createButton];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme:) name:@"changeTheme1" object:nil];
  
}
-(void)createButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(60, 60, 60, 60);
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
}
-(void)changeTheme:(NSNotification *)not
{
    self.view.backgroundColor = not.userInfo[@"Color"];
    self.title = not.userInfo[@"Title"];
}
-(void)changeColor:(UIColor *)color
{
    self.view.backgroundColor = color;
}
-(void)btnClick
{
    V2ViewController * v2 = [[V2ViewController alloc] init];
    v2.delegate = self;
    [v2 setGreenChange:^(UIColor * color) {
        self.view.backgroundColor = color;
    }];
    [self.navigationController pushViewController:v2 animated:YES];
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
