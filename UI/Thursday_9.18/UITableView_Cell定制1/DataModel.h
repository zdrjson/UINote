//
//  DataModel.h
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
{
    NSMutableArray * _arrayData;
}
@property (nonatomic,retain)NSMutableArray *arrayData;
+(DataModel *)shareDataModel;
-(void)loadCellModel;

@end
