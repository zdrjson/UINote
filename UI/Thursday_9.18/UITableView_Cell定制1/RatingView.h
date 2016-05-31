//
//  RatingView.h
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingView : UIView
{
    float _rating;
}
@property (nonatomic,retain) UIImageView * backView;
@property (nonatomic,retain) UIImageView * frontView;
//@property float rating;
-(void)setRating:(float)rating;

@end
