//
//  DataModel.h
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
{
    NSMutableArray * _dataArray;
    
    NSMutableArray * _aDArray;
    
}
+(DataModel *)shareDataModel;

@property (nonatomic,retain) NSMutableArray * dataArray;
@property (nonatomic,retain) NSMutableArray * aDArray;
-(void)loadCellModel;
-(void)loadAdModel;
@end
