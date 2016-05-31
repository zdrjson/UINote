//
//  LoginUserModel.h
//  KVO
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginUserModel : NSObject
@property (nonatomic,copy) NSString * userId;
@property (nonatomic,copy) NSString * nickName;
+(id)loginUser;
@end
