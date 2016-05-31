//
//  MyCell.h
//  Friday_11.14_UICollectionView
//
//  Created by qianfeng on 14-11-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"
@interface MyCell : UICollectionViewCell
-(void)fillData:(ImageModel *)model;
@end
