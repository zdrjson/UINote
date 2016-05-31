//
//  RatingView.h
//  UITableView_Cell定制
//
//  Created by ZSQ on 14-9-18.
//  Copyright (c) 2014年 ZSQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingView : UIView
{
    //保存用户的评分
    float _rating;
}
//背景图片视图，显示五星的白色图片
@property (nonatomic, retain) UIImageView *backView;
//前景图片视图，根据用户评分显示相应的黄色图片
@property (nonatomic, retain) UIImageView *frontView;

//设置用户的评分，以及调整前景视图的显示星级
- (void)setRating:(float)rating;
@end
