//
//  ThemeManager.h
//  ThemeManager
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject
{
    NSString * _name;
}
@property (nonatomic,retain) NSString * name;
+(id)sharedThemeManager;
@end
