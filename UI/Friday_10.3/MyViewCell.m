//
//  MyViewCell.m
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyViewCell.h"

@implementation MyViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        

    }
    return self;
}
-(void)createSubViews
{
    _ratingView = [[RatingView alloc] initWithFrame:CGRectMake(68, 56, 80, 19)];
    [self.contentView addSubview:_ratingView];
}
-(void)setCellModel:(CellModel *)cellModel
{
    _cellModel= cellModel;
    _vIconImage.image = [UIImage imageNamed:cellModel.Icon];
    _lName.text = cellModel.Name;
    _lPublisher.text = cellModel.Publisher;
    _lPrice.text = cellModel.Price;
    _lNumRating.text = cellModel.NumRatings;
    [self createSubViews];
    [_ratingView setRating:cellModel.Rating];
   
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
