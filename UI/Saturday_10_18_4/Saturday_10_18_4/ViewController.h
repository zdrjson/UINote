//
//  ViewController.h
//  Saturday_10_18_4
//
//  Created by qianfeng on 14-10-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#define GROUP_NAME @"GROUP_NAME"
#define GROUP_STATE @"GROUP_STATE"
#define GROUP_CONTENT @"GROUP_CONTENT"
@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tabelView;
    NSMutableArray * _dataArray;
}
@end
