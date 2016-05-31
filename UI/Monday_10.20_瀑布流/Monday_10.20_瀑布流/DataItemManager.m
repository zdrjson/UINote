//
//  DataItemManager.m
//  Monday_10.20_瀑布流
//
//  Created by qianfeng on 14-10-20.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "DataItemManager.h"
#import "DataItem.h"

@interface DataItemManager ()
{
    NSArray * _arr;
    NSMutableArray * _leftDataArray;
    NSMutableArray * _middleDataArray;
    NSMutableArray * _rightDataArray;

}


@end

@implementation DataItemManager
+(id)sharedManger
{
    static id _s = nil;
    if (!_s) {
        _s = [[[self class] alloc] init];
    }
    return _s;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
         _arr = @[@"category_All.jpg",@"category_Book.jpg",@"category_Business.jpg",@"category_Catalogs.jpg",@"category_Education.jpg",@"category_Pastime.jpg",@"category_Finance.jpg",@"category_FoodDrink.jpg",@"category_Game.jpg",@"category_Health.jpg",@"category_Life.jpg",@"category_Medical.jpg",@"category_Music.jpg",@"category_Gps.jpg",@"category_News.jpg",@"category_Photography.jpg",@"category_Ability.jpg",@"category_Refer.jpg",@"category_Social.jpg",@"category_Sports.jpg",@"category_Travel.jpg",@"category_Tool.jpg",@"category_Weather.jpg"];
    }
    return self;
}
-(NSMutableArray *)getLeftData
{   _leftDataArray = [NSMutableArray array];
    for (int i = 0; i<_arr.count; i++) {
        UIImage * image = [UIImage imageNamed:_arr[i]];
        DataItem * item = [[DataItem alloc] init];
        item.image = image;
        [_leftDataArray addObject:item];
    }
    return _leftDataArray;
}
-(NSMutableArray *)getMiddleData
{
    _rightDataArray = [NSMutableArray array];
    for (int i = 0; i<_arr.count; i++) {
        UIImage * image = [UIImage imageNamed:_arr[i+1]];
        DataItem * item = [[DataItem alloc] init];
        item.image = image;
        [_rightDataArray addObject:item];
    }
    return _rightDataArray;

}
-(NSMutableArray *)getRightData
{
    _rightDataArray = [NSMutableArray array];
    for (int i = 0; i<_arr.count; i++) {
        UIImage * image = [UIImage imageNamed:_arr[i+2]];
        DataItem * item = [[DataItem alloc] init];
        item.image = image;
        [_rightDataArray addObject:item];
    }
    return _rightDataArray;
}
@end
