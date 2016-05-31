//
//  MyViewCell.m
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyViewCell.h"

@implementation MyViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createSubViews];
    }
    return self;
}
//创建自己的子控件
-(void)createSubViews
{
    _vIconImage = [[UIImageView alloc] init];
    _vIconImage.frame = CGRectMake(5, 5, 59, 60);
//    _vIconImage.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_vIconImage];
    
    _lPublisher = [[UILabel alloc] init];
    _lPublisher.frame = CGRectMake(68, 5, 180, 15);
//    _lPublisher.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_lPublisher];
    
    _lName = [[UILabel alloc] init];
    _lName.frame = CGRectMake(68, 23, 100, 30);
//    _lName.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_lName];
    
    _lPrice = [[UILabel alloc] init];
    _lPrice.frame = CGRectMake(230, 23, 80, 30);
//    _lPrice.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_lPrice];
    
    _lNumRating = [[UILabel alloc] init];
    _lNumRating.frame = CGRectMake(180, 58, 60, 17);
//    _lNumRating.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_lNumRating];
    
    
    _ratingView = [[RatingView alloc] initWithFrame:CGRectMake(68, 56, 80, 19)];
    [self.contentView addSubview:_ratingView];
    
}
-(void)setCellModel:(CellModel *)cellModel
{
    _cellModel = cellModel;
    _vIconImage.image = [UIImage imageNamed:_cellModel.iconName];
    _lPublisher.text = _cellModel.publisher;
    _lName.text = _cellModel.name;
    _lNumRating.text = _cellModel.numRating;
    _lPrice.text = _cellModel.price;
    [_ratingView setRating:_cellModel.rating];
    
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
