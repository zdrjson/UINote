//
//  MyCell.h
//  Monday_11.17_TableView横向使用
//
//  Created by qianfeng on 14-11-17.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgv;
@property (nonatomic,copy) NSString * imgName;
@end
