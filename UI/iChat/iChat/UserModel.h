//
//  UserModel.h
//  iChat
//
//  Created by qianfeng on 14-10-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface UserModel : BaseModel
@property (nonatomic,copy) NSString * username;
@property (nonatomic,copy) NSString * userid;
@property (nonatomic,copy) NSString * usernickname;
@property (nonatomic,copy) NSString * userpassword;

@end
