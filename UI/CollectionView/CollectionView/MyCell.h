//
//  MyCell.h
//  CollectionView
//
//  Created by qianfeng on 14-11-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"
@interface MyCell : UICollectionViewCell
-(void)fillData:(ImageModel *)model;
@end
