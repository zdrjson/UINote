//
//  RatingView.m
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createSubViews];
    }
    return self;
}
-(void)createSubViews
{
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsBackground"]];
    [self addSubview:_backView];
    
    _frontView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsForeground"]];
    _frontView.contentMode = UIViewContentModeBottomLeft;
    _frontView.clipsToBounds = YES;
    [self addSubview:_frontView];

}

-(void)setRating:(float)rating
{
    _rating = rating;
    _frontView.frame = CGRectMake(0, 0, _backView.frame.size.width *rating/5, _backView.frame.size.height);

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
