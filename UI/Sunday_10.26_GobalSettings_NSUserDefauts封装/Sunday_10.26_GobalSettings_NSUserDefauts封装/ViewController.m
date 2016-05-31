//
//  ViewController.m
//  Sunday_10.26_GobalSettings_NSUserDefauts封装
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "GobalSettings.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int n = [GobalSettings readIntValueWithKey:@"IsFirst"];
    if (n==-1) {
        //说明是第一次
        [GobalSettings saveIntValue:1 forKey:@"IsFirst"];
    }
    else
    {
        NSLog(@"不是第一次");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
