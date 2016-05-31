//
//  UserModel.h
//  Sunday_11.2_iChat
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel
@property (nonatomic,copy) NSString * username;
@property (nonatomic,copy) NSString * usernickname;
@property (nonatomic,copy) NSString * userpassword;
@property (nonatomic,copy) NSString * userid;

@end
