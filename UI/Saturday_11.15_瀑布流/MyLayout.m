//
//  MyLayout.m
//  Saturday_11.15_瀑布流
//
//  Created by qianfeng on 14-11-15.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
-(CGSize)collectionViewContentSize
{
    CGFloat leftHeight = 0.0;
    CGFloat rightHeight = 0.0;
    for (int i = 0; i<_dataArray.count; i++) {
        CGFloat h = [_dataArray[i] cellHeight];
        if (leftHeight<=rightHeight) {
            leftHeight+=h;
        }
        else
        {
            rightHeight+=h;
        }
    }
    return CGSizeMake(0, leftHeight<rightHeight?rightHeight:leftHeight);
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat leftHeight = 0.0;
    CGFloat rightHeight = 0.0;
    CGFloat cellHeight = [_dataArray[indexPath.row] cellHeight];
    for (int i = 0; i<indexPath.row; i++) {
        CGFloat h = [_dataArray[i] cellHeight];
        if (leftHeight<=rightHeight) {
            leftHeight+=h;
        }
        else
        {
            rightHeight+=h;
        }
    }
    if (leftHeight<=rightHeight) {
        attr.center = CGPointMake(80, leftHeight+ cellHeight/2);
    }
    else
    {
        attr.center = CGPointMake(240, rightHeight+cellHeight/2);
    }
    attr.size = CGSizeMake(160, cellHeight);
    return attr;
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i<[self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [arr addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return arr;
}
@end
