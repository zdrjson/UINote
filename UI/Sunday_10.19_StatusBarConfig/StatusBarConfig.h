//
//  StatusBarConfig.h
//  Sunday_10.19_StatusBarConfig
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusBarConfig : NSObject
+(void)showMsg:(NSString *)str;
+(void)showMsg:(NSString *)str withTextColor:(UIColor *)textColor;
+(void)showMsg:(NSString *)str withTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)backgroundColor;
@end
