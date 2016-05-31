//
//  ViewController.m
//  Thursday_10.16_1
//
//  Created by qianfeng on 14-10-16.
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
}
-(void)createButtons
{
    NSArray * titleArray = @[@"红色",@"绿色"];
    for (int i =0 ; i<2; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(60+i*60, 60, 60, 60);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.tag = 101+i;
        [self.view addSubview:btn];
    }
    
    
}
-(void)btnClick:(UIButton *)btn
{
    if (btn.tag==101) {
        
    }
    else if(btn.tag ==102)
    {
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
