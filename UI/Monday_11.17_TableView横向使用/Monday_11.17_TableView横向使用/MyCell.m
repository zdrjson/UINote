//
//  MyCell.m
//  Monday_11.17_TableView横向使用
//
//  Created by qianfeng on 14-11-17.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
-(void)setImgName:(NSString *)imgName
{
    _imgv.image = [UIImage imageNamed:imgName];
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
