//
//  RootViewController.m
//  Http_同步下载
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
    //URL 统一资源定位，一个url代表了一个链接地址，代表了一个资源
    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    //创建一个请求数据包，请求的资源是url代表的资源
    NSURLRequest * urlRequest = [[NSURLRequest alloc] initWithURL:url];
    //存储返回的错误内容
    NSError * error = nil;
    //存储返回的响应包（应答内容）
    NSURLResponse * urlresponse = nil;
    //存储返回的数据
    NSData * data = nil;
    //这个方法会一直阻塞，直到数据下载完成，或者出错
    //通过这个方法，我们向服务器发送一个同步下载请求数据包
    //如果没有出错，就会返回我们需要的数据到data中
    //参数1：请求包
    //参数2：返回响应包
    //参数3：如果出错，返回的错误代码（内容）
   data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlresponse error:&error];
    //没有出错
    if (error==nil) {
        NSLog(@"urlResponse = %@",urlresponse);
        NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"html = %@",html);
    }
    else
    {
        //打印出错内容
        NSLog(@"error = %@",error);
    }
    
    

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
