//
//  FirstViewController.h
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    
    NSMutableArray * _dataArray;
    
    NSMutableArray * _aDArray;
    
    NSMutableArray * _array;
}
@end
