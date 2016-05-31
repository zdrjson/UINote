//
//  StudentEntity.h
//  Friday_10.31_CoreDat数据库
//
//  Created by qianfeng on 14-10-31.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StudentEntity : NSManagedObject

@property (nonatomic, retain) NSString * sName;
@property (nonatomic, retain) NSNumber * sId;

@end
