//
//  ChatEngine.m
//  Sunday_11.2_iChat
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ChatEngine.h"
#import "HttpRequstManager.h"
#import "UserModel.h"
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
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0/30.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    }
    return self;
}
static int n = 0;
-(void)timerAction
{
    if (n%30==0) {
        [self userList];
    }
    n++;
}
-(void)userList
{
    //定时发起请求，请求完成后，调用cb
    NSString * userListUrl = [__kHOST stringByAppendingString:__kGET_USER_LIST];
    [HttpRequstManager GET:userListUrl complete:^(NSData * data) {
        _loadUserList([UserModel parsingJsonData:data]);
    } failed:^{
        
    }];
    
}
-(void)getUrlList:(void (^)(NSMutableArray *))cb
{
    _loadUserList = cb;
}
@end
