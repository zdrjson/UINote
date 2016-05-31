//
//  RootViewController.m
//  Friday3_9.19
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

    _data = [[NSMutableData alloc] init];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 150, 250, 300)];
    _imageView.backgroundColor = [UIColor grayColor];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
}
-(void)createButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 40, 150, 50);
    [btn setTitle:@"点击下载" forState:UIControlStateNormal];
    [btn addTarget:self  action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}
-(void)btnPress
{
    [_data setLength:0];
    NSURL * url = [NSURL URLWithString:@"http://img0.bdstatic.com/img/image/shouye/qcfll-9562134003.jpg"];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    NSURLConnection * urlConn = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:NO];
    
    [urlConn start];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError = %@",error);
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
    NSLog(@"didReceiveResponse = %@",response);
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
    NSLog(@"didReceiveData,data = %@",data);
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoadin");
//    NSString * html = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
//    NSLog(@"html = %@",html);
    _imageView.image = [UIImage imageWithData:_data];
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
