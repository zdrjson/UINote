//
//  GobalSettings.m
//  Sunday_10.26_GobalSettings_NSUserDefauts封装
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "GobalSettings.h"

@implementation GobalSettings
+(void)saveValue:(id)v forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:v forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)saveIntValue:(int)v forKey:(NSString *)key
{
    [self saveValue:@(v) forKey:key];
}
+(id)readValueWithKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
+(int)readIntValueWithKey:(NSString *)key
{
    NSNumber * n = [self readValueWithKey:key];
    if (!n) {
        return -1;
    }
   return n.intValue;
}
@end
