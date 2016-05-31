//
//  ViewController.m
//  Quartz
//
//  Created by qianfeng on 14-11-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)loadView//初始化self.view
{
    MyView * view = [[MyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = view;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //如果需要绘图的话，可以通过两种方式
    //1.内存图
    //2.UIView
    [self performSelector:@selector(action) withObject:self afterDelay:2];
}
-(void)action
{
    [self.view setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view setNeedsDisplay];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
