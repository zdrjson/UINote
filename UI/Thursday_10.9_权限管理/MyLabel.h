//
//  MyLabel.h
//  Thursday_10.9_权限管理
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLabel : UILabel
@property (nonatomic,retain)id target;
@property(nonatomic,assign)SEL selector;
-(void)addTarget:(id)target action:(SEL)selector;
@end
