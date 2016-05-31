//
//  CacheManager.m
//  Thursday_10.23_单例
//
//  Created by qianfeng on 14-10-23.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager
static CacheManager * _m = nil;

//+(id)shareManager
//{
//     @synchronized(self)
//    {
//        if (!_m) {
//            _m = [[CacheManager alloc] init];
//        }
//    }
//    return _m;
//}
+(id)shareManager
{
    dispatch_once_t once = 0;
    dispatch_once(&once, ^{
        if (!_m) {
            _m = [[CacheManager alloc] init];
        }
    });
    return _m;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        //耗时1秒
        sleep(1);
    }
    return self;
}
+(id)allocWithZone:(struct _NSZone *)zone
{
    if (!_m) {
       _m = [super allocWithZone:zone];
    }
    return _m;
}
//在ios 6之前，需要重写copy方法
-(id)copy
{
    return _m;
}
+(id)copyWithZone:(struct _NSZone *)zone
{
    return self;
}
@end
