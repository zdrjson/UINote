//
//  QFXmppManager.h
//  Sunday_11.2_ChatDemo
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"
#import "UserModel.h"
@interface QFXmppManager : NSObject
{
    //nsurlconnectin
    XMPPStream * _xmppStream;
}
@property (nonatomic,copy) void(^saveRegcb)(BOOL ret,NSError * error);
@property (nonatomic,copy) void(^saveLoginCb)(BOOL ret,NSError * error);
@property (nonatomic,strong) UserModel * currentUser;
@property (nonatomic,assign) BOOL isInRegisting;
@property (nonatomic,strong) NSMutableArray * allFriendList;
+(id)shareInstance;
//Jabber ID
-(void)registerUser:(NSString *)jib  withPasswordFeild:(NSString *)password withCompletion:(void(^)(BOOL ret,NSError * error))cb;
-(void)loginUser:(NSString *)jib withPasswordFeild:(NSString *)password withCompletion:(void (^)(BOOL, NSError *))cb;
-(void)goOnline;
@end
