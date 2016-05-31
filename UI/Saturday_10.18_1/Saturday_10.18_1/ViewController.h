//
//  ViewController.h
//  Saturday_10.18_1
//
//  Created by qianfeng on 14-10-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *_leftTableView;
    UITableView *_middelTableView;
    UITableView *_rightTableView;
    NSMutableArray * _leftArrayData;
    NSMutableArray * _middleArrayData;
    NSMutableArray * _rightArrayData;
}
@end
