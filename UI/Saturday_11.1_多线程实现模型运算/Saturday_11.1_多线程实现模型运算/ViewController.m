//
//  ViewController.m
//  Saturday_11.1_多线程实现模型运算
//
//  Created by qianfeng on 14-11-1.
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
//    NSMutableArray * arr = [[NSMutableArray alloc] init];
//    for (int i = 0; i<100; i++) {
//        [arr addObject:[NSString stringWithFormat:@"数据:%d",i]];
//    }
//    dispatch_apply(arr.count, dispatch_get_global_queue(0, 0), ^(size_t n) {
//        NSLog(@"%@",arr[n]);
//    });
    //参数1：线程个数（这里50个任务）
    //参数2：线程队列
    //参数3：block 任务 n从0-49
    
    //创建50个线程
    dispatch_apply(50, dispatch_get_global_queue(0, 0), ^(size_t n) {
        NSLog(@"%zu",n);
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
