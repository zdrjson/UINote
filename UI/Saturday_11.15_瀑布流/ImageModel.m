//
//  ImageModel.m
//  Saturday_11.15_瀑布流
//
//  Created by qianfeng on 14-11-15.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
+(NSMutableArray *)parsingJsonData:(NSData *)data
{
    NSMutableArray * arr = [NSMutableArray array];
    id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if ([res isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dic = (NSDictionary *)res;
        NSArray * tempArr = dic[@"data"];
        for (NSDictionary * tempdic in tempArr) {
            id model  = [[self alloc] init];
            [model setValuesForKeysWithDictionary:tempdic];
            [arr addObject:model];
        }
    }
    dispatch_apply(arr.count, dispatch_get_global_queue(0, 0), ^(size_t n) {
         ImageModel * model = arr[n];
        model.cellHeight = [model.image_height floatValue]/[model.image_width floatValue]*150+10;
    });
    return arr;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
