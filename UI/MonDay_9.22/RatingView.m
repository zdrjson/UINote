//
//  RatingView.m
//  UITableView_Cell定制
//
//  Created by ZSQ on 14-9-18.
//  Copyright (c) 2014年 ZSQ. All rights reserved.
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

- (void)createSubViews
{
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsBackground"]];
    //设置当前视图的显示模式
//    _backView.contentMode = UIViewContentModeLeft;
    [self addSubview:_backView];
    
    _frontView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsForeground"]];
    //设置当前视图的显示模式
    _frontView.contentMode = UIViewContentModeLeft;
    //设置当前视图是否裁剪，YES会将当前显示模式下，超出显示宽度的内容裁剪
    _frontView.clipsToBounds = YES;
    [self addSubview:_frontView];
    
}

//设置用户的评分，以及调整前景视图的显示星级
- (void)setRating:(float)rating
{
    _rating = rating;
   //根据用户评价来设置前景视图的显示宽度
    _frontView.frame = CGRectMake(0, 0, _backView.frame.size.width * _rating/5.0, _frontView.frame.size.height);
   
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
