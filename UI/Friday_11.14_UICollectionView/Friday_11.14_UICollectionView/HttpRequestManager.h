//
//  HttpRequestManager.h
//  爱限免
//
//  Created by huangdl on 14-10-8.
//  Copyright (c) 2014年 1000phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) void(^completecb)(NSData *);
@property (nonatomic,copy) void(^failedcb)();

@property (nonatomic,assign) BOOL isCache;
@property (nonatomic,copy) NSString *cacheName;
@property (nonatomic,assign) BOOL isList;
@property (nonatomic,assign) NSInteger currentPage;

@property (nonatomic,strong) NSData *returnData;

-(void)startRequest;

@end

//高内聚 低耦合

@interface HttpRequestManager : NSObject

+(void)GET:(NSString *)url complete:(void(^)(NSData *))completeCB failed:(void(^)())failedCB;

//详情页使用的缓存
+(void)GET:(NSString *)url complete:(void(^)(NSData *))completeCB failed:(void(^)())failedCB isCache:(BOOL)cache;

//列表页缓存
+(void)GET:(NSString *)url 
  complete:(void(^)(NSData *))completeCB 
    failed:(void(^)())failedCB 
   isCache:(BOOL)cache 
 cacheName:(NSString *)name 
    isList:(BOOL)islist 
      page:(NSInteger)page;

@end












