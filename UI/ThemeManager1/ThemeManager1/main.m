//
//  main.m
//  ThemeManager1
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeManager.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        ThemeManager * tm = [ThemeManager sharedThemeManager];
        ThemeManager * tm1  = [ThemeManager sharedThemeManager];
        NSLog(@"tm name is %@,tm2 name is %@",tm.name,tm1.name);
    }
    return 0;
}

