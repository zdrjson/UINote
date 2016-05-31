//
//  MyViewCell.h
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
#import "RatingView.h"
@interface MyViewCell : UITableViewCell
@property (nonatomic,retain)CellModel * cellModel;
@property (weak, nonatomic) IBOutlet UIImageView *vIconImage;
@property (weak, nonatomic) IBOutlet UILabel *lPublisher;
@property (weak, nonatomic) IBOutlet UILabel *lName;
@property (weak, nonatomic) IBOutlet UILabel *lPrice;
@property (weak, nonatomic) IBOutlet UILabel *lNumRating;
@property (nonatomic,retain) RatingView * ratingView;
@end
