//
//  ImageNameDataModel.m
//  Thursday_10.2
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ImageNameDataModel.h"

@implementation ImageNameDataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"imageList" ofType:@"plist"];
        _imageNameArray = [NSArray arrayWithContentsOfFile:plistPath];
    }
    return self;
}

+(ImageNameDataModel *)shareImageNameData
{
    static  ImageNameDataModel * imageName = nil;
    if (!imageName) {
        imageName = [[ImageNameDataModel alloc] init];
    }
    return imageName;
}

@end
