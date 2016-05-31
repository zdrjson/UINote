//
//  HttpRequestManager.m
//  爱限免
//
//  Created by huangdl on 14-10-8.
//  Copyright (c) 2014年 1000phone. All rights reserved.
//

#import "HttpRequestManager.h"

@implementation HttpRequest
{
    NSMutableData *_data;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableData alloc]init];
    }
    return self;
}
-(void)startRequest
{

    
    
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]] delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _completecb(_data);

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _failedcb();
}


@end

@interface HttpRequestManager ()

+(id)sharedManager;

@end


@implementation HttpRequestManager
{
    NSMutableArray *_requestArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requestArray = [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)sharedManager
{
    static HttpRequestManager *_m = nil;
    if (!_m) {
        _m = [[HttpRequestManager alloc]init];
    }
    return _m;
}

-(void)getUrl:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void (^)())failedCB isCache:(BOOL)cache cacheName:(NSString *)name isList:(BOOL)islist page:(NSInteger)page
{
    //如果已经下载过了,则直接返回数据
//    for (HttpRequest *req in _requestArray) {
//        if ([req.url isEqualToString:url]) {
//            completeCB(req.returnData);
//            return;
//        }
//    }
    
    HttpRequest *req = [[HttpRequest alloc]init];
    req.url = url;
    req.completecb = completeCB;
    req.failedcb = failedCB;
    req.isCache = cache;
    req.cacheName = name;
    req.isList = islist;
    req.currentPage = page;
    [req startRequest];
    [_requestArray addObject:req];
}

+(void)GET:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void (^)())failedCB
{
    [self GET:url complete:completeCB failed:failedCB isCache:NO];
}

//详情页
+(void)GET:(NSString *)url complete:(void(^)(NSData *))completeCB failed:(void(^)())failedCB isCache:(BOOL)cache
{
    [self GET:url complete:completeCB failed:failedCB isCache:cache cacheName:url isList:NO page:0];
}

//列表页
+(void)GET:(NSString *)url complete:(void(^)(NSData *))completeCB failed:(void(^)())failedCB isCache:(BOOL)cache cacheName:(NSString *)name isList:(BOOL)islist page:(NSInteger)page
{
    [[HttpRequestManager sharedManager]getUrl:url complete:completeCB failed:failedCB isCache:cache cacheName:name isList:islist page:page];
}



@end





