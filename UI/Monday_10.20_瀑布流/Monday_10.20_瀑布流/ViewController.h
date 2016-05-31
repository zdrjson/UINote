//
//  ViewController.h
//  Monday_10.20_瀑布流
//
//  Created by qianfeng on 14-10-20.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UITableView * _leftTableView;
    UITableView * _middleTableView;
    UITableView * _rightTableView;
    
    NSMutableArray * _leftDataArray;
    NSMutableArray * _middleDataArray;
    NSMutableArray * _rightDataArray;
}
@end
