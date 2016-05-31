//
//  QFTabItem.m
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "QFTabItem.h"

@implementation QFTabItem
-(void)setNormalImage:(UIImage *)img
{
    [super setImage:img forState:UIControlStateNormal];
}
-(void)setHighlightImage:(UIImage *)img
{
    [super setImage:img forState:UIControlStateHighlighted];

}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
