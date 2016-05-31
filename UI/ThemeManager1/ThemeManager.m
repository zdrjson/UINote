//
//  ThemeManager.m
//  ThemeManager1
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager
+(ThemeManager *)sharedThemeManager
{
    static ThemeManager * tm = nil;
    if (tm==nil) {
        tm = [[ThemeManager alloc] init];
    }
    return tm;
    
}
//+(id)allocWithZone:(struct _NSZone *)zone
//{
////    NSLog(@"%@",[self sharedThemeManager]);
//    return [self sharedThemeManager];
//}
//+(id)copyWithZone:(struct _NSZone *)zone
//{
//    NSLog(@"%@",self);
//    return self;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"ddd";
    }
    return self;
}

@end
