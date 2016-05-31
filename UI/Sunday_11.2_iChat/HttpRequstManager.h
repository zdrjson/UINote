//
//  HttpRequstManager.h
//  爱限免new
//
//  Created by qianfeng on 14-10-12.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequst : NSObject <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
@property (nonatomic,copy) NSString * url;
@property (nonatomic,copy) void (^completecb)(NSData *);
@property (nonatomic,copy) void (^failedcb)();
@property (nonatomic,assign) BOOL isCache;
@property (nonatomic,copy) NSString * cacheName;
@property (nonatomic,assign)BOOL isList;
@property (nonatomic,assign) NSInteger currentPage;
-(void)startRequest;

@end

@interface HttpRequstManager : NSObject
+(void)GET:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void (^)())failedCB;

//详情页
+(void)GET:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void (^)())failedCB isCache:(BOOL)isCache;
+(void)GET:(NSString *)url complete:(void (^)(NSData *))completeCB failed:(void(^)())failedCB isCache:(BOOL)isCache CacheName:(NSString *)cacheName isList:(BOOL)isList currentPage:(NSInteger)page;
@end
