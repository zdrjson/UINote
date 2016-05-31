//
//  ImageModel.m
//  Thuesday_11.4_CollctionView
//
//  Created by qianfeng on 14-11-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
+(NSMutableArray *)parsingJsonData:(NSData *)data
{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if ([res isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dic = (NSDictionary *)res;
        NSArray * tempArr = dic[@"data"];
        for (NSDictionary * dict in tempArr) {
            id model = [[self alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [arr addObject:model];
        }
    }
    //用多线程计算行高
    dispatch_apply(arr.count, dispatch_get_global_queue(0, 0), ^(size_t n) {
        ImageModel * model = arr[n];
        model.cellHeight = [model.image_height floatValue]/[model.image_width floatValue] * 150+10;
    });
    return arr;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
