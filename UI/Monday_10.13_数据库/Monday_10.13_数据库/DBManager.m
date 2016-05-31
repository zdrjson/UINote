//
//  DBManager.m
//  Monday_10.13_数据库
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "DBManager.h"
#import "FMDatabase.h"
@implementation DBManager
{
    FMDatabase * _fmdb;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString * dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/user.db"];
        _fmdb = [[FMDatabase alloc] initWithPath:dbPath];
        BOOL isSuccess = [_fmdb open];
        if (!isSuccess) {
            NSLog(@"打开数据库失败:%@",_fmdb.lastErrorMessage);
        }
        else
        {
            NSString * createSql = @"create table if not exists user(userid integer primary key autoincrement,username varchar(64),phonenumber char(16),hearImg blob)";
            BOOL success = [_fmdb executeUpdate:createSql];
            if (!success) {
                NSLog(@"创建表失败:%@",_fmdb.lastErrorMessage);
            }
        
        }
        
    }
    return self;
}
+(id)sharedManager
{
    static DBManager * _m = nil;
    if (!_m) {
        _m = [[DBManager alloc] init];
    }
    return _m;
}
-(void)insertUser:(UserModel *)model
{
    NSString * sql = @"insert into user(username,phonenumber) values(?,?)";
    BOOL success = [_fmdb executeUpdate:sql,model.userName,model.phoneNumber];
    if (!success) {
        NSLog(@"添加用户错误:%@",_fmdb.lastErrorMessage);
    }
}
-(void)deleteUser:(UserModel *)model
{
//    NSLog(@"删除 ：%d",model.userId);
    NSString * sql = @"delete from user where userid = ?";
    BOOL success = [_fmdb executeUpdate:sql,@(model.userId)];
    if (!success) {
        NSLog(@"删除用户失败:%@",_fmdb.lastErrorMessage);
    }
}
-(void)updateUser:(UserModel *)model
{
//    NSLog(@"修改 ：%d",model.userId);
    NSString * sql = @"update user set username = ? ,phonenumber = ? where userid = ?";
    BOOL success = [_fmdb executeUpdate:sql,model.userName,model.phoneNumber,@(model.userId)];
    if (!success) {
        NSLog(@"更新数据失败:%@",_fmdb.lastErrorMessage);
    }
}
-(NSMutableArray *)fetchAll
{
    NSString * sql = @"select * from user";
    FMResultSet * res = [_fmdb executeQuery:sql];
    NSMutableArray * arr = [NSMutableArray array];
    while ([res next]) {
        UserModel * model = [[UserModel alloc] init];
        model.userId = [res intForColumn:@"userid"];
        model.userName = [res stringForColumn:@"username"];
        model.phoneNumber = [res stringForColumn:@"phonenumber"];
        [arr addObject:model];
    }
    return arr;
}
-(NSArray *)searchWithStr:(NSString *)str
{
    return nil;
}
@end
