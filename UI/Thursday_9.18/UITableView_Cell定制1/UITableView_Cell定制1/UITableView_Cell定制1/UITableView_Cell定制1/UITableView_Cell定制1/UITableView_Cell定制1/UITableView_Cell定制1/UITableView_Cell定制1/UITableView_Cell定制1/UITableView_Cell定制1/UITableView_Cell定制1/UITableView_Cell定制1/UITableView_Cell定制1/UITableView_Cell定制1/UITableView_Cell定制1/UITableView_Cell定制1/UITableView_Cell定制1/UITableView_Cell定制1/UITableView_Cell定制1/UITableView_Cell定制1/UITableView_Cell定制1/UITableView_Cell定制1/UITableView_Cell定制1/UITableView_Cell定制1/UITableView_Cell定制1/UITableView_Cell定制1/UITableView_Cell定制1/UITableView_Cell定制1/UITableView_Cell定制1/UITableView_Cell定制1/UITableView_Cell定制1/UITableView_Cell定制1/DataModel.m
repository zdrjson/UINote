//
//  DataModel.m
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "DataModel.h"
#import "CellModel.h"
@implementation DataModel
+(DataModel *)shareDataModel
{
    static DataModel *dm = nil;
    if (dm==nil) {
        dm =[[DataModel alloc] init];
        [dm loadCellModel];
    }
    return dm;
}
-(void)loadCellModel
{
    _arrayData = [[NSMutableArray alloc] init];
    
    NSString * strPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSArray * arrayData = [NSArray arrayWithContentsOfFile:strPath];
    for (NSDictionary * dict in arrayData) {
        CellModel *cellModel = [[CellModel alloc] init];
        cellModel.name = [dict objectForKey:@"Name"];
        cellModel.publisher = [dict objectForKey:@"Publisher"];
        cellModel.numRating = [[dict objectForKey:@"NumRatings"] stringValue];
        cellModel.rating = [[dict objectForKey:@"Rating"] floatValue];
        cellModel.price = [dict objectForKey:@"Price"];
        cellModel.iconName = [dict objectForKey:@"Icon"];
        [_arrayData addObject:cellModel];
        
    }

}
@end
