//
//  Common.h
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VoteViewController.h"
#import "TopicViewController.h"
#import "CommentViewController.h"
#import "PicViewController.h"
#import "NewsViewController.h"
#import "QFTabBarController.h"
#import "QFImageView.h"

#define  QFDEBUG 1
#if  1
#define QFLog(a...) NSLog(a)
#else
#define QFLog(a...)
#endif