//
//  AppModel.h
//  Sunday_9.28
//
//  Created by qianfeng on 14-9-28.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define __string(__k__) @property (nonatomic,retain) NSString * __k__
@interface AppModel : NSObject
__string(applicationId);
__string(name);
__string(description);

__string(currentPrice);
__string(fileSize);
__string(iconUrl);
+ (NSMutableArray *)parsingWithJsonData:(NSData *)data;

@end
