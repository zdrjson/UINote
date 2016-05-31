//
//  ImageNameDataModel.h
//  Thursday_10.2
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageNameDataModel : NSObject

@property (nonatomic,retain) NSArray * imageNameArray;
+(ImageNameDataModel *)shareImageNameData;

@end
