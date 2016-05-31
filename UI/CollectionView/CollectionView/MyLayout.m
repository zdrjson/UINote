//
//  MyLayout.m
//  CollectionView
//
//  Created by qianfeng on 14-11-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
//返回collectionView的内容的大小
-(CGSize)collectionViewContentSize
{
    CGFloat leftHeight = 0.0;
    CGFloat rightHeight = 0.0;
   
    for (int i = 0; i<_dataArray.count; i++) {
        CGFloat h = [_dataArray[i]cellHeight];
        if (leftHeight<=rightHeight) {
            leftHeight+=h;
        }
        else
        {
            rightHeight+=h;
        }
    }
    return CGSizeMake(0, leftHeight>rightHeight?leftHeight:rightHeight);
}
//返回某一个cell对应的属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat cellHeight = [_dataArray[indexPath.row] cellHeight];
    CGFloat leftHeight = 0.0;
    CGFloat rightHegiht = 0.0;
    for (int i = 0; i<indexPath.row; i++) {
        CGFloat h = [_dataArray[i]cellHeight];
        if (leftHeight<=rightHegiht) {
            leftHeight += h;
        }
        else
        {
            rightHegiht += h;
        }
    }
    if (leftHeight <=rightHegiht) {
        attr.center = CGPointMake(80, leftHeight+cellHeight/2);
    }
    else
    {
        attr.center = CGPointMake(240, rightHegiht+cellHeight/2);
    }
    attr.size = CGSizeMake(160, cellHeight);
    return attr;
}
//返回包含所有的cell的属性的数组
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (int i = 0; i<[self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath * indepPath = [NSIndexPath indexPathForItem:i inSection:0];
       [arr addObject:[self layoutAttributesForItemAtIndexPath:indepPath]];
    }
    return arr;
}
@end
