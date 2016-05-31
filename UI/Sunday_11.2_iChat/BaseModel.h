//
//  BaseModel.h
//  Sunday_11.2_iChat
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
+(NSMutableArray *)parsingJsonData:(NSData *)data;
@end
