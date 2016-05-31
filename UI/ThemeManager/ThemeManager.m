//
//  ThemeManager.m
//  ThemeManager
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ThemeManager.h"
static ThemeManager * s;
@implementation ThemeManager
+(id)sharedThemeManager
{
    if (s==nil) {
        s = [[[self class] alloc] init];
    }
    return s;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"sss";
    }
    return self;
}
@end
