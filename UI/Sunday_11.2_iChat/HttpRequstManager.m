//
//  HttpRequstManager.m
//  爱限免new
//
//  Created by qianfeng on 14-10-12.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "HttpRequstManager.h"

@implementation HttpRequst
{
    NSMutableData * _data;

}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableData alloc] init];
    }
    return self;
}
-(void)startRequest
{
    
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]] delegate:self];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _failedcb();
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
@end

@interface HttpRequstManager ()

+(id)sharedManager;

@end

@implementation HttpRequstManager
+(id)sharedManager
{
    static id _m;
    if (!_m) {
        _m = [[self alloc] init];
    }
    return _m;
}
-(void)get:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void(^)())failedCB isCache:(BOOL)isCache CacheName:(NSString *)cacheName isList:(BOOL)isList currentPage:(NSInteger)page
{
    HttpRequst * req = [[HttpRequst alloc] init];
    req.url = url;
    req.completecb = completeCB;
    req.failedcb = failedCB;
    req.isCache = isCache;
    req.cacheName = cacheName;
    req.isList = isList;
    req.currentPage = page;
    [req startRequest];
}
+(void)GET:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void (^)())failedCB
{
    [self GET:url complete:completeCB failed:failedCB isCache:NO];
}
//详情页
+(void)GET:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void (^)())failedCB isCache:(BOOL)isCache
{
    [self GET:url complete:completeCB failed:failedCB isCache:isCache CacheName:url isList:NO currentPage:0];

}
//列表页
+(void)GET:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void(^)())failedCB isCache:(BOOL)isCache CacheName:(NSString *)cacheName isList:(BOOL)isList currentPage:(NSInteger)page
{
    [[self sharedManager] get:url complete:completeCB failed:failedCB isCache:isCache CacheName:cacheName isList:isList currentPage:page];
}
@end
