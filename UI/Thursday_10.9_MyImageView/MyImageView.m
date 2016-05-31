//
//  MyImageView.m
//  Thursday_10.9_MyImageView
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView
-(void)addSingleTarget:(id)target action:(SEL)selector

{
    self.userInteractionEnabled = YES;
    _target = target;
    _selector = selector;
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * t = [touches anyObject];
    if (t.tapCount>=2) {
        if ([_dTargt respondsToSelector:_selector]) {
            [_dTargt performSelector:_dSelector withObject:self];
        }
    }
    else
    {
        if ([_target respondsToSelector:_selector]) {
            [_target performSelector:_selector withObject:self];
        }
    
    }
    
}
-(void)addDoubleTarget:(id)target action:(SEL)selctor
{
    self.userInteractionEnabled = YES;
    _dTargt = target;
    _dSelector = selctor;
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
