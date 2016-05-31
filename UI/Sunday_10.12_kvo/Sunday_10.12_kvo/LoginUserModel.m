//
//  LoginUserModel.m
//  Sunday_10.12_kvo
//
//  Created by qianfeng on 14-10-12.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "LoginUserModel.h"

@implementation LoginUserModel
+(id)loginUser
{
    static LoginUserModel * _m = nil;
    if (!_m) {
        _m = [[LoginUserModel alloc] init];
    }
    return _m;
}
@end
