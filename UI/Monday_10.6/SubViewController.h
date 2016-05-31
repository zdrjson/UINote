//
//  SubViewController.h
//  Monday_10.6
//
//  Created by qianfeng on 14-10-6.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController
@property (nonatomic,retain) id target;
@property (nonatomic) SEL sel;
-(void)addTarget:(id)target selector:(SEL)sel;
@end
