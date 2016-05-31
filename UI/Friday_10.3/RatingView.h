//
//  RatingView.h
//  Friday_10.3
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingView : UIView
{
    float _rating;
}
@property (nonatomic,retain)UIImageView * backView;
@property (nonatomic,retain)UIImageView * frontView;
-(void)setRating:(float)rating;

@end
