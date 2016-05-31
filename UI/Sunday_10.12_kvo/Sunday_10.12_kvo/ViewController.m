//
//  ViewController.m
//  Sunday_10.12_kvo
//
//  Created by qianfeng on 14-10-12.
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createButton];
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app addObserver:self forKeyPath:@"keyName" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
    [self createLabel];
   
    
    
}
-(void)createLabel
{
     _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 49)];
     LoginUserModel * model = [LoginUserModel loginUser];
    _label.text = model.nickName;
    [self.view addSubview:_label];
    [model addObserver:self forKeyPath:@"nickName" options:3 context:nil];
    

}
-(void)createButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 50, 100, 50);
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)click
{
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    app.keyName = [NSString stringWithFormat:@"%d",arc4random()%5];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"nickName"]) {
        _label.text = change[@"new"];
    }
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    NSLog(@"%@",app.keyName);//新值
    NSLog(@"%@",change);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
