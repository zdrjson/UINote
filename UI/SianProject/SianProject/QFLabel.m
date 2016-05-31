//
//  QFLabel.m
//  SianProject
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "QFLabel.h"

@implementation QFLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_isNormal) {
        self.textColor = _highlightColor;
    }
    else
    {
        self.textColor = _normalColor;
    }
    _isNormal =!_isNormal;
    
    if ([_tatget respondsToSelector:_action]) {
        [_tatget performSelector:_action withObject:self];
    }


}
-(void)addClickEvent:(id)target selector:(SEL)action
{
    _tatget = target;
    _action = action;

}

@end
