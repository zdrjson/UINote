//
//  RootViewController.m
//  Http_同步下载2
//
//  Created by qianfeng on 14-9-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    [self createButton];
}
-(void)createButton
{
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame =CGRectMake(30, 50, 150, 40);
    [btn setTitle:@"点击下载" forState:UIControlStateNormal];
    [btn addTarget:self  action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)btnPress:(UIButton *)btn
{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    //创建一个可变url请求数据包，它继承自NSURLRequest
    //NSURLRequest
    NSMutableURLRequest * ulrMuRequest = [[NSMutableURLRequest alloc] init];
    //设置请求包请求资源
    [ulrMuRequest setURL:url];
    
    //设置请求超时的时间
    [ulrMuRequest setTimeoutInterval:60];
    //设置缓存数据
    //NSURLRequestReloadIgnoringLocalCacheData - 忽略本地缓存数据，直接下载
    //NSURLRequestReturnCacheDataElseLoad - 返回缓存数据，如果数据部不存在，则下载
    //NSURLRequestReturnCacheDataDontLoad - 返回缓存数据，不下载，如果返回中没有数据，则返回空
    [ulrMuRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    NSError *error = nil;
    NSURLResponse * urlResponse = nil;
    NSData *data= nil;
    
    data = [NSURLConnection sendSynchronousRequest:ulrMuRequest returningResponse:&urlResponse error:&error];
    if (error==nil) {
        
        NSLog(@"urlResponse = %@",urlResponse);
//        NSString * html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",html);
    }
    else
    {
        NSLog(@"error = %@",error);
    }
    //应用程序的沙盒目录
    NSLog(@"%@",NSHomeDirectory());
    

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
