//
//  ImageNameDataModel.h
//  Saturday_9.13
//
//  Created by qianfeng on 14-9-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageNameDataModel : NSObject

@property (nonatomic,retain)NSArray *arrayImage;

+(ImageNameDataModel *)shareImageNameDataModel;

@end
