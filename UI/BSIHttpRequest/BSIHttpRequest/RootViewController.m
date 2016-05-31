//
//  RootViewController.m
//  BSIHttpRequest
//
//  Created by qianfeng on 14-10-5.
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
    [self bsiDemo];
    
//    NSDictionary * dict = [NSDictionary dictionary];
//    NSMutableDictionary * dict1 = [NSMutableDictionary dictionary];
//    dict1 = [dict mutableCopy];
//    [dict1 setObject:@"d" forKey:@"f"];
//    NSLog(@"%@",dict1);
}
-(void)bsiDemo
{
    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    BSIHttpRequest * r = [[BSIHttpRequest alloc] initWithUrl:url];
    r.tag = 100;
    r.delegate = self;
    [r startAsync];
    
    
}
-(void)bsiDemo2
{
     NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    BSIHttpRequest * r2 = [BSIHttpRequest requestUrl:url];
//    r2.tag = 102;
    [r2 setCompletionBlocks:^void(BSIHttpRequest *r) {
//        NSLog(@"%@",r.responseData);
        NSLog(@"a");
    }];
    [r2 startAsync];
    
    
}

-(void) requestFinish:(BSIHttpRequest *)r
{
    NSString * s = r.responseString;
    NSData * d = r.responseData;
    NSString * s1 = [s stringByAppendingString:@"d"];//新创建一个
    NSLog(@"%p %p",s1,s);
    NSLog(@"%@",d);
    NSLog(@"file is %s",__FILE__);
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
