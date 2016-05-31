//
//  BSIDemo.m
//  BSIHttpRequest
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "BSIDemo.h"

@implementation BSIDemo
-(void)bsiDemo
{
    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    BSIHttpRequest * r = [[BSIHttpRequest alloc] initWithUrl:url];
    r.tag = 100;
    r.delegate = self;
    [r startAsync];
    
    BSIHttpRequest * r2 = [BSIHttpRequest requestUrl:url];
    r2.tag = 102;
    [r2 setCompletionBlocks:^(BSIHttpRequest *r) {
        NSString * s = r.responseString;
        NSData * d = r.responseData;
    }];
    [r2 startAsync];
    
  
}
-(void) requestFinish:(BSIHttpRequest *)r
{
    NSString * s = r.responseString;
    NSData * d = r.responseData;
    
   
   
}
@end
