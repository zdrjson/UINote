//
//  LoginUserModel.m
//  KVO
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "LoginUserModel.h"

@implementation LoginUserModel
+(id)loginUser
{
    static LoginUserModel * m = nil;
    if (!m) {
        m = [[LoginUserModel alloc] init];
    }
    return m;
}
@end
