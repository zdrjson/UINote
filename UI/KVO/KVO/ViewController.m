//
//  ViewController.m
//  KVO
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "LoginUserModel.h"
@interface ViewController ()
{
    UILabel * _label;
}
@end

@implementation ViewController
/*
     反向传值
     1：协议代理
     2:target-action
     3:blocks
     4:通知中心
     5：kvo+单例
 
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 150, 300, 44);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:0xFFFFFFFF];
    [self.view addSubview:btn];
    //添加观察
    AppDelegate * app = [[UIApplication sharedApplication] delegate];
    [app addObserver:self forKeyPath:@"keyName" options:3 context:nil];
    
    _label = [[UILabel alloc] initWithFrame:self.view.bounds];
    _label.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:_label];
    LoginUserModel * model = [LoginUserModel loginUser];
    _label.text = model.nickName;
    [model addObserver:self forKeyPath:@"nickName" options:3 context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"d");
    if ([keyPath isEqualToString:@"nickName"]) {
        LoginUserModel * model = [LoginUserModel loginUser];
        _label.text = model.nickName;
    }
//    AppDelegate * app = [[UIApplication sharedApplication] delegate];
//    
//    NSLog(@"%@",app.keyName);
  
}
-(void)click
{
    AppDelegate * app = [[UIApplication sharedApplication] delegate];
    app.keyName = [NSString stringWithFormat:@"new %d",arc4random()];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
