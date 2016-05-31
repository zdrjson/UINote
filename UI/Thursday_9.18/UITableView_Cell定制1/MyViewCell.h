//
//  MyViewCell.h
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
#import "RatingView.h"
@interface MyViewCell : UITableViewCell
{
    UILabel * _lName;
    UILabel * _lPublisher;
    UILabel * _lNumRating;
    UILabel * _lPrice;
    
    UIImageView * _vIconImage;
    
    CellModel * _cellModel;
    
    RatingView * _ratingView;

}
//@property (nonatomic,retain)CellModel * cellModel;
-(void)setCellModel:(CellModel *)cellModel;

@end
