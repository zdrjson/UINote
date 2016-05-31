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
    [self addSubview:_vIconImage];
    
    _lPublisher = [[UILabel alloc] init];
    _lPublisher.frame = CGRectMake(68, 5, 180, 15);
//    _lPublisher.backgroundColor = [UIColor blueColor];
    [self addSubview:_lPublisher];
    
    _lName = [[UILabel alloc] init];
    _lName.frame = CGRectMake(68, 23, 100, 30);
//    _lName.backgroundColor = [UIColor yellowColor];
    [self addSubview:_lName];
    
    _lPrice = [[UILabel alloc] init];
    _lPrice.frame = CGRectMake(230, 23, 80, 30);
//    _lPrice.backgroundColor = [UIColor greenColor];
    [self addSubview:_lPrice];
    
    _lNumRating = [[UILabel alloc] init];
    _lNumRating.frame = CGRectMake(180, 58, 60, 17);
//    _lNumRating.backgroundColor = [UIColor purpleColor];
    [self addSubview:_lNumRating];
    
}
-(void)setCellModel:(CellModel *)cellModel
{
    _cellModel = cellModel;
    _vIconImage.image = [UIImage imageNamed:_cellModel.iconName];
    _lPublisher.text = _cellModel.publisher;
    _lName.text = _cellModel.name;
    _lNumRating.text = _cellModel.numRating;
    _lPrice.text = _cellModel.price;
    
    
    

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
