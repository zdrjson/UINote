//
//  ViewController.m
//  Sunday_10.26_XML
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIWebView * _webView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createUIWebView];
    
}
-(void)createUIWebView
{
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self.view addSubview:_webView];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    NSString * content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSURL * baseUrl = [[NSBundle mainBundle] bundleURL];
    
    
    NSMutableString * content1 = [content mutableCopy];
    NSRange range = [content1 rangeOfString:@"%@"];
    [content1 replaceCharactersInRange:range withString:@"Title"];
    [_webView loadHTMLString:content1 baseURL:baseUrl];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
