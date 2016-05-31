//
//  ViewController.h
//  Saturday_10.18_瀑布流
//
//  Created by qianfeng on 14-10-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    
    __weak IBOutlet UITableView *_leftTableView;
    __weak IBOutlet UITableView *_middleTableView;
    __weak IBOutlet UITableView *_rightTableView;
    NSMutableArray * _leftArrayData;
    NSMutableArray * _middleArrayData;
    NSMutableArray * _rightArrayData;
}

@end
