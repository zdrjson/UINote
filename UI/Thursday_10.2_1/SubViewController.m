//
//  SubViewController.m
//  Thursday_10.2_1
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "SubViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createSwitch];
}
-(void)createSwitch
{
    UISwitch * sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    [sw addTarget:self action:@selector(swValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw];
    
}
-(void)swValueChanged:(UISwitch *)sw
{
    NSDictionary * d;
    if (sw.isOn) {
        d = [NSDictionary dictionaryWithObject:@"打开" forKey:@"ON"];
    }
    else
    {
        d = [NSDictionary dictionaryWithObject:@"关闭" forKey:@"OFF"];
    }

    NSNotification * not = [[NSNotification alloc] initWithName:@"OpenOrClose" object:nil userInfo:d];
    [[NSNotificationCenter defaultCenter] postNotification:not];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
