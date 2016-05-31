//
//  DataModel.m
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "DataModel.h"
#import "CellModel.h"
#import "ADModel.h"
@implementation DataModel
+(DataModel *)shareDataModel
{
    static DataModel * dm = nil;
    if (!dm) {
        dm = [[DataModel alloc] init];
//        dm = [[self alloc] init];
//        dm = [[[self class] alloc] init];
        [dm loadCellModel];//'-'减号方法，对象来调用
        [dm loadAdModel];
        
    }
    return dm;
}
-(void)loadCellModel
{
    _dataArray = [[NSMutableArray alloc] init];
    
    NSString * pathPlist = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];

    NSArray * arrayData = [NSArray arrayWithContentsOfFile:pathPlist];
    
    for (NSDictionary * d in arrayData) {
        CellModel * cellModel = [[CellModel alloc] init];
        cellModel.Name = d[@"Name"];
        cellModel.Publisher = d[@"Publisher"];
        cellModel.NumRatings = [d[@"NumRatings"] stringValue];;
        cellModel.Rating = [d[@"Rating"] floatValue];
        cellModel.Price = d[@"Price"];
        cellModel.Icon = d[@"Icon"];
        [_dataArray addObject:cellModel];
    }
    
}

-(void)loadAdModel
{
    _aDArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<4; i++) {
        ADModel * ad = [[ADModel alloc] init];
        ad.adImageName = [NSString stringWithFormat:@"image%d",i];
        ad.adTitleName = [NSString stringWithFormat:@"第%d个广告标题",i];
        [_aDArray addObject:ad];
    }
   
}
@end
