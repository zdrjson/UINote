//
//  ViewController.m
//  Monday_10.20_瀑布流
//
//  Created by qianfeng on 14-10-20.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "DataItemManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self prepareData];
}
-(void)prepareData
{
    _leftDataArray = [[DataItemManager sharedManger] getLeftData];
     _middleDataArray = [[DataItemManager sharedManger] getMiddleData];
     _rightDataArray = [[DataItemManager sharedManger] getRightData];
    NSLog(@"%@",_leftDataArray);

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
