//
//  public.h
//  iChat
//
//  Created by qianfeng on 14-10-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//
//一般用来定义IP地址:URL //整个项目除这个里面 其他地方不要有宏定义
#ifndef iChat_public_h//HOST主体
#define iChat_public_h

//#define __kHOST @"http://192.168.88.171/1409/chat/"
#define __kHOST @"http://121.41.34.197/chat/"
//#define __kHOST @"http://192.168.84.13/"

#define __kGET_USER_LIST @"users.php"
#define __kREGISTER @"register.php"
#define __kLOGIN @"login.php"
#define __kSEND_MSG @"sendmessage.php"
#define __kRECIEVE_MSG @"recievemessage.php"
#define __kMsg_Received_Notification @"MsgReceiveNotification"//单词和单词之间用下划线分隔为：匈牙利分隔法

#endif
