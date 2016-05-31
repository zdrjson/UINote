//
//  AddEditViewController.h
//  Monday_10.13_数据库
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@interface AddEditViewController : UIViewController
@property (nonatomic ,retain)UserModel * model;
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberText;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)addAction:(id)sender;
@property(nonatomic,copy)void(^addcb)();
@end
