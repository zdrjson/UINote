//
//  SubViewController.h
//  Monday_9.29_6
//
//  Created by qianfeng on 14-9-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController

@property (nonatomic,retain) id target;
@property (nonatomic,assign) SEL action;

-(void)addTarget:(id)object Selector:(SEL)selector;
@end
