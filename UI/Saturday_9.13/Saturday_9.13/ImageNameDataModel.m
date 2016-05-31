//
//  ImageNameDataModel.m
//  Saturday_9.13
//
//  Created by qianfeng on 14-9-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ImageNameDataModel.h"

@implementation ImageNameDataModel
-(id)init
{
    if (self =[super init]) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"imageList" ofType:@"plist"];
        _arrayImage = [NSArray arrayWithContentsOfFile:plistPath];
    }
    return self;
}
+(ImageNameDataModel *)shareImageNameDataModel
{
     static ImageNameDataModel *dm =nil;
    if (dm==nil) {
        dm =[[ImageNameDataModel alloc]init];
    }
    return dm;
}
@end
