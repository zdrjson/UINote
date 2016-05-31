//
//  GobalSettings.h
//  Sunday_10.26_GobalSettings_NSUserDefauts封装
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GobalSettings : NSObject
+(void)saveValue:(id)v forKey:(NSString *)key;
+(void)saveIntValue:(int)v forKey:(NSString *)key;
+(id)readValueWithKey:(NSString *)key;
+(int)readIntValueWithKey:(NSString *)key;
@end
