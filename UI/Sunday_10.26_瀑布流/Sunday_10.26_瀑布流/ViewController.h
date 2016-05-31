//
//  ViewController.h
//  Sunday_10.26_瀑布流
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataItem.h"
@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _leftTableView;
    UITableView * _middelTableView;
    UITableView * _rightTableView;
    
    NSMutableArray * _leftDataArray;
    NSMutableArray * _middleDataArray;
    NSMutableArray * _rightDataArray;
}
@end
