//
//  RootViewController.m
//  Http_异步下载
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
    _data = [[NSMutableData alloc] init];
    [self createButton];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 150, 250, 300)];
    _imageView.backgroundColor = [UIColor grayColor];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
}
-(void)createButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 50, 150, 40);
    [btn setTitle:@"点击下载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}
-(void)btnPress:(UIButton *)btn
{
    //删除上次保存的数据
    [_data setLength:0];
    //创建统一的资源定位对象
    NSURL * url = [NSURL URLWithString:@"http://img2.3lian.com/img2007/22/07/010.jpg"];
    
    //创建请求数据包
    NSMutableURLRequest *urlRequest =[[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    //创建连接对象
    //参数1：请求数据包
    //参数2：代理对象
    //参数3：是否立即启动 YES立即启动 NO不立即启动 手动启动
    NSURLConnection * urlCon = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:NO];
    //同步下载
//    NSURLConnection sendSynchronousRequest:<#(NSURLRequest *)#> returningResponse:<#(NSURLResponse *__autoreleasing *)#> error:<#(NSError *__autoreleasing *)#>
    //同步下载与异步下载的区别（同步会阻塞，异步不会）
    //同步下载会阻塞当前主线程，直到数据下载完毕，或者出错返回才能够继续执行下面的代码
    //异步下载 当发起一个异步下载时，会开启一个新的线程来下载数据，自身立即返回，并执行下面的代码
    
    //启动异步下载
    [urlCon start];
}
//当下载失败时，自动调用该方法
//参数1：当前的启动下载的连接对象
//参数2：当前错误下载失败的错误信息
//NSURLConnectionDelegate协议方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError = %@",error);

}
//返回一个应答包,从服务器传回应答包的内容给客户端
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //清除上次保存的数据
    [_data setLength:0];
//    NSLog(@"didReceiveResponse = %@",response);
    
}
//从服务器端返回数据时调用方法
//这个方法有可能调用多次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //添加服务端传回的数据
    //如果返回的数据较大，则可能分成多段数据分次返回
    [_data appendData:data];
//    NSLog(@"didReceiveData,data = %@",data);
    
}
//服务器的数据发送完成后自动调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading");
    NSString * html = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
//    NSLog(@"html = %@",html);
    _imageView.image = [UIImage imageWithData:_data];
   
    
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
