//
//  NewsViewController.h
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableView.h"
#import "ColumnView.h"
@interface NewsViewController : UIViewController <columnViewProtocol>
{
    NSMutableArray * _dataArray ;
    MyTableView * _tableView;
    ColumnView * _cv;
    NSMutableArray * _titleArray;

}
@end
