//
//  QFLabel.h
//  SianProject
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFLabel : UILabel
{
    id _tatget;
    SEL _action;
    BOOL _isNormal;
}

@property (nonatomic,retain)UIColor * highlightColor;
@property (nonatomic,retain)UIColor * normalColor;
-(void)setNormalColor:(UIColor *)nColor;
-(void)setSelectedColor:(UIColor *)sColor;
-(void)addClickEvent:(id)target selector:(SEL)action;

@end
