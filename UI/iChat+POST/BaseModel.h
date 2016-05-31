//
//  BaseModel.h
//  iChat
//
//  Created by qianfeng on 14-10-30.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
+(NSMutableArray *)parsingJsonData:(NSData *)data;
@end
