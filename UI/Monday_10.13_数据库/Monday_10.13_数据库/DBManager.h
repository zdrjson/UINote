//
//  DBManager.h
//  Monday_10.13_数据库
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface DBManager : NSObject
+(id)sharedManager;
-(void)insertUser:(UserModel *)model;
-(void)deleteUser:(UserModel *)model;
-(void)updateUser:(UserModel *)model;
-(NSMutableArray *)fetchAll;
-(NSArray *)searchWithStr:(NSString *)str;
@end
