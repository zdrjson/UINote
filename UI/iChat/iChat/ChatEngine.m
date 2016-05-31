//
//  ChatEngine.m
//  iChat
//
//  Created by qianfeng on 14-10-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ChatEngine.h"
#import "HttpRequstManager.h"
#import "LoginUserModel.h"
#import "MsgCell.h"
@implementation ChatEngine
{
    NSTimer * _timer;
}
+(id)sharedEngine
{
    static ChatEngine * _e = nil;
    if (!_e) {
        _e = [[ChatEngine alloc] init];
    }
    return _e;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _msgArray = [[NSMutableArray alloc] init];
        _timer =[NSTimer scheduledTimerWithTimeInterval:2.0/30.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
           }
    return self;
}
static int n = 0;
-(void)timerAction
{
//    if (n%30==0) {
//        [self userList];
//        
//    }
//    if (n%30==0) {
//        [self msgList];
//    }
    [self userList];
    [self msgList];
    n++;
}
-(void)msgList
{
    NSString * msgUrl = [NSString stringWithFormat:@"%@%@?userid=%@",__kHOST,__kRECIEVE_MSG,[[LoginUserModel user] userid]];
    [HttpRequstManager GET:msgUrl complete:^(NSData * data) {
        NSMutableArray * arr = [MsgModel parsingJsonData:data];
        for (MsgModel * model in arr) {
            [MsgCell calcHeight:model];
        }
        //先保存到数据库
        [_msgArray addObjectsFromArray:arr];
        //分发
       
        [[NSNotificationCenter defaultCenter] postNotificationName:__kMsg_Received_Notification object:nil userInfo:nil];
        
    } failed:^{
        
    }];
}
-(void)userList
{
    //定时发起请求 请求完成后，调用cb
    NSString * userListUrl = [__kHOST stringByAppendingString:__kGET_USER_LIST];
    [HttpRequstManager GET:userListUrl complete:^(NSData * data) {
        NSMutableArray * arr = [UserModel parsingJsonData:data];
        _loadUserList(arr);
    } failed:^{
        
    }];

}
-(void)getUrlList:(void(^)(NSMutableArray *))cb
{
    _loadUserList = cb;
}
//注册
-(void)registerWithUser:(UserModel * )user failed:(void(^)(NSString *,BOOL))failedcb
{
    _registercb = failedcb;
    if (!user.username||user.username.length==0) {
        failedcb(@"用户名不能为空",NO);
        return;
    }
    NSString * checkUrl = [NSString stringWithFormat:@"%@checkusername.php?username=%@",__kHOST,user.username];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString * res = [NSString stringWithContentsOfURL:[NSURL URLWithString:checkUrl] encoding:NSUTF8StringEncoding error:nil];
       dispatch_async(dispatch_get_main_queue(), ^{
           if ([res isEqualToString:@"0"]) {
               _registercb(@"用户名已经存在",NO);
           }
           else
           {
               [self reg:user];
           }
       });
    });
}
-(void)reg:(UserModel *)user
{
    NSString * url = [__kHOST stringByAppendingString:__kREGISTER];
    
    NSString * getUrl = [NSString stringWithFormat:@"%@?username=%@&password=%@&nickname=%@",url,user.username,user.userpassword,user.usernickname];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString * res = [NSString stringWithContentsOfURL:[NSURL URLWithString:getUrl] encoding:NSUTF8StringEncoding error:nil];
       dispatch_async(dispatch_get_main_queue(), ^{
           if ([res isEqualToString:@"0"]) {
               _registercb(@"注册失败，请稍后再试!",NO);
           }
           else
           {
               _registercb(nil,YES);
           }
       });
    });
}
-(void)loginWithUser:(UserModel *)user message:(void(^)(NSString *,BOOL))msgcb
{
    //登入用户肯定是单例
    _logincb = msgcb;
    NSString * loginUrl = [NSString stringWithFormat:@"%@%@?username=%@&password=%@",__kHOST,__kLOGIN,user.username,user.userpassword];
    [HttpRequstManager GET:loginUrl complete:^(NSData * data) {
        NSString * resStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if ([resStr isEqualToString:@"error"]) {
            _logincb(@"用户名或者密码错误",NO);
        }
        else
        {
            [[LoginUserModel user] loginWithData:data];
            _logincb(nil,YES);
        }
    } failed:^{
        
    }];
}
-(void)sendMsg:(MsgModel *)msg message:(void (^)(NSString *, BOOL))msgcb
{
    if (!msg.msgtext||msg.msgtext.length==0) {
        msgcb(@"发送内容不能为空",NO);
        return;
    }
    _sendMsg = msgcb;
    [MsgCell calcHeight:msg];
    [_msgArray addObject:msg];
    
    NSString * msgUrl = [NSString stringWithFormat:@"%@%@?text=%@&fromid=%@&toid=%@&type=%@",__kHOST,__kSEND_MSG,msg.msgtext,msg.userfromid,msg.usertoid,msg.msgtype];
    
    msgUrl = [Tools stringFromChURL:msgUrl];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString * resStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:msgUrl] encoding:NSUTF8StringEncoding error:nil];
       dispatch_async(dispatch_get_main_queue(), ^{
           if ([resStr isEqualToString:@"1"]) {
               _sendMsg(nil,YES);
           }
           else
           {
               _sendMsg(@"发送失败",NO);
           }
       });
    });
    
}
@end
