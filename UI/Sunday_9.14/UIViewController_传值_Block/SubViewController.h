//
//  SubViewController.h
//  Sunday_9.14
//
//  Created by qianfeng on 14-9-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^block)(UIColor *);
@interface SubViewController : UIViewController

@property (nonatomic,copy)block block;

@end
