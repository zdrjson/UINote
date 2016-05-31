//
//  MyCell.m
//  Friday_11.14_UICollectionView
//
//  Created by qianfeng on 14-11-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyCell.h"
#import "UIKit+AFNetworking.h"
@implementation MyCell
{
    UIImageView * _imgv;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _imgv = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgv];
    }
    return self;
}
-(void)fillData:(ImageModel *)model
{
    _imgv.frame = CGRectMake(5, 5, 150, self.contentView.frame.size.height-10);
    [_imgv setImageWithURL:[NSURL URLWithString:model.thumbnail_url]];
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
