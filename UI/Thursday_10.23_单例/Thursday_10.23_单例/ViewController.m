//
//  ViewController.m
//  Thursday_10.23_单例
//
//  Created by qianfeng on 14-10-23.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "CacheManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CacheManager * m = [CacheManager shareManager];
        NSLog(@"%@",m);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CacheManager * m2= [CacheManager shareManager];
        NSLog(@"%@",m2);
    });
    
    CacheManager * m = [[CacheManager alloc] init];
    NSLog(@"%@",m);
    
    CacheManager * m2 = [m copy];
    NSLog(@"%@",m2);
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
