//
//  ViewController.m
//  Thursday_10.23_多线程实现模型运算
//
//  Created by qianfeng on 14-10-23.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (int i = 0; i<100; i++) {
        [arr addObject:[NSString stringWithFormat:@"数据:%d",i]];
    }
    dispatch_apply(arr.count, dispatch_get_global_queue(0, 0), ^(size_t n) {
        NSLog(@"%@",arr[n]);
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
