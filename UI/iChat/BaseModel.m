//
//  BaseModel.m
//  iChat
//
//  Created by qianfeng on 14-10-30.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
+(NSMutableArray *)parsingJsonData:(NSData *)data
{
    NSMutableArray * returnArr =[[NSMutableArray alloc] init];
    
    id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray * arr = (NSArray *)res;
    for (NSDictionary * dic in arr) {
        id  model = [[self alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [returnArr addObject:model];
    }
    return returnArr;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
