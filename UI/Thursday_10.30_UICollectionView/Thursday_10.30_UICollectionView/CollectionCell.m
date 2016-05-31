//
//  CollectionCell.m
//  Thursday_10.30_UICollectionView
//
//  Created by qianfeng on 14-10-30.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化加载CollecitonCelll.xib文件
        NSArray * arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionCell" owner:self options:nil];
        //如果路径不存在，return nil
        if (arrayOfViews.count==0) {
            return nil;
        }
        //如果xib中的view不属于UICollecitonViewCell类，return nil
        if(![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        //加载xib
        self =  [arrayOfViews objectAtIndex:0];
    }
    return self;
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
