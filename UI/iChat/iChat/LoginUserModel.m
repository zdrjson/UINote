//
//  LoginUserModel.m
//  iChat
//
//  Created by qianfeng on 14-10-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "LoginUserModel.h"

@implementation LoginUserModel
+(id)user
{
    static LoginUserModel * _m = nil;
    if (!_m) {
        _m = [[LoginUserModel alloc] init];
    }
    return _m;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)loginWithData:(NSData *)data
{
    id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dic = (NSDictionary *)res;
    LoginUserModel * model = [LoginUserModel user];
    [model setValuesForKeysWithDictionary:dic];
    
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
