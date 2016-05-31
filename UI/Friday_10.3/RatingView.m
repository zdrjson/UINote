//
//  RatingView.m
//  Friday_10.3
//
//  Created by qianfeng on 14-10-4.
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
    _backView = [[UIImageView alloc] init];
    _backView.image = [UIImage imageNamed:@"StarsBackground"];
    _backView.frame = CGRectMake(0, 0, _backView.image.size.width, _backView.image.size.height);
    [self addSubview:_backView];
    
    _frontView = [[UIImageView alloc] init];
    _frontView.image = [UIImage imageNamed:@"StarsForeground"];
    [self addSubview:_frontView];
}
#define kNumberOfStars 5
-(void)setRating:(float)rating
{
    _rating = rating;
    _frontView.frame = CGRectMake(0, 0, (_frontView.image.size.width/kNumberOfStars)*_rating, self.bounds.size.height);
    _frontView.contentMode = UIViewContentModeLeft;
    _frontView.clipsToBounds = YES;
    
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
