//
//  CellModel.h
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
//发行者
@property (nonatomic,retain) NSString * publisher;
//名称
@property (nonatomic,retain) NSString * name;
//投票人数
@property (nonatomic,retain) NSString * numRating;
//评分
@property float rating;
//价格
@property (nonatomic,retain) NSString * price;
//图片名称
@property (nonatomic,retain) NSString * iconName;

@end
