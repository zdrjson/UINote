//
//  DataItemManager.h
//  Monday_10.20_瀑布流
//
//  Created by qianfeng on 14-10-20.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataItemManager : NSObject
+(id)sharedManger;
-(NSMutableArray *)getLeftData;
-(NSMutableArray *)getMiddleData;
-(NSMutableArray *)getRightData;
@end
