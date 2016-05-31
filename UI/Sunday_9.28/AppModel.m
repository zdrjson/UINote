//
//  AppModel.m
//  Sunday_9.28
//
//  Created by qianfeng on 14-9-28.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

+ (NSMutableArray *)parsingWithJsonData:(NSData *)data
{
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dic =(NSDictionary *)res;
    NSArray * arr = dic[@"applications"];
    for (NSDictionary * d in arr) {
        AppModel * appModel = [[AppModel alloc] init];
        //KVC
        [appModel setValuesForKeysWithDictionary:d];
        [dataArray addObject:appModel];
        
    }
    return dataArray;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
