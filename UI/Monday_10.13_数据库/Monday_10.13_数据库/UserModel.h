//
//  UserModel.h
//  Monday_10.13_数据库
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,assign) NSInteger userId;
@property (nonatomic,copy) NSString * userName;
@property (nonatomic,copy) NSString * phoneNumber;
@property (nonatomic,strong) UIImage * headerImg;
@end
