//
//  SubViewController.h
//  Sunday_9.14
//
//  Created by qianfeng on 14-9-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController

@property (nonatomic,retain) id target;

@property (nonatomic)SEL action;

-(void)addTarget:(id)objects forSelector:(SEL)selector;

@end
