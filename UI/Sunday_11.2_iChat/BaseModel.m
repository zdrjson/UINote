//
//  BaseModel.m
//  Sunday_11.2_iChat
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
+(NSMutableArray *)parsingJsonData:(NSData *)data
{
    NSMutableArray * returnArr = [NSMutableArray array];
    id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if ([res isKindOfClass:[NSArray class]]) {
        NSArray * arr = (NSArray *)res;
        for (NSDictionary * dic in arr) {
            id model = [[[self class] alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [returnArr addObject:model];
        }
    }
    return returnArr;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
