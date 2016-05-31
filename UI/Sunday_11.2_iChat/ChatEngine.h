//
//  ChatEngine.h
//  Sunday_11.2_iChat
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatEngine : NSObject
@property (nonatomic,copy) void(^loadUserList)(NSMutableArray *);
+(id)sharedEngine;
//获取好友列表
-(void)getUrlList:(void(^)(NSMutableArray *))cb;

@end
