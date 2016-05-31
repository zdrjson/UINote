//
//  MyLayout.m
//  Friday_11.14_UICollectionView
//
//  Created by qianfeng on 14-11-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
//返回collctionView的内容的大小
-(CGSize)collectionViewContentSize
{
    CGFloat leftHeight = 0.0;
    CGFloat rightHeght = 0.0;
    for (int i = 0; i<_dataArray.count; i++) {
        CGFloat h = [_dataArray[i] cellHeight];
        if (leftHeight<=rightHeght) {
            leftHeight+=h;
        }
        else
        {
            rightHeght+=h;
        }
    }
    return CGSizeMake(0, leftHeight<rightHeght?rightHeght:leftHeight);
}
//返回某个cell对应的属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat cellHeight = [_dataArray[indexPath.row] cellHeight];
    CGFloat leftHeight = 0.0;
    CGFloat rightHeight = 0.0;
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
        attr.center = CGPointMake(80, leftHeight+cellHeight/2);
    }
    else
    {
        attr.center = CGPointMake(240, rightHeight+cellHeight/2);
    }
    attr.size = CGSizeMake(160, cellHeight);
    return attr;
    
}
//返回包含所有的cell的属性的数组
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (int i = 0; i<[self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [arr addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return arr;
}
@end
