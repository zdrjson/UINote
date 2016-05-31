//
//  ChatEngine.h
//  iChat
//
//  Created by qianfeng on 14-10-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "MsgModel.h"
@interface ChatEngine : NSObject
+(id)sharedEngine;
@property (nonatomic,strong) NSMutableArray * msgArray;
@property (nonatomic,copy)void(^loadUserList)(NSMutableArray *);
@property (nonatomic,copy)void(^registercb)(NSString *,BOOL);
@property (nonatomic,copy)void(^logincb)(NSString *,BOOL);
@property (nonatomic,copy)void(^sendMsg)(NSString *,BOOL);
//获取好友列表
-(void)getUrlList:(void(^)(NSMutableArray *))cb;

//注册
-(void)registerWithUser:(UserModel * )user failed:(void(^)(NSString *,BOOL))failedcb;

//登入
-(void)loginWithUser:(UserModel *)user message:(void(^)(NSString *,BOOL))msgcb;
//发送消息
-(void)sendMsg:(MsgModel *)msg message:(void(^)(NSString *,BOOL))msgcb;
//接收消息

//修改签名
@end
