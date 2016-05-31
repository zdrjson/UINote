//
//  MsgModel.h
//  iChat
//
//  Created by qianfeng on 14-10-30.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "BaseModel.h"

@interface MsgModel : BaseModel
@property (nonatomic,copy) NSString * msgid;
@property (nonatomic,copy) NSString * userfromid;
@property (nonatomic,copy) NSString * usertoid;
@property (nonatomic,copy) NSString * msgtext;
@property (nonatomic,copy) NSString * msgtype;

@property (nonatomic,assign) BOOL isFromMe;
@property (nonatomic,assign) CGSize cellSize;
@end
