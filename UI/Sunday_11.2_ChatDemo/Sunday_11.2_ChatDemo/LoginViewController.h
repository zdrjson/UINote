//
//  LoginViewController.h
//  Sunday_11.2_ChatDemo
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)regClick:(id)sender;
- (IBAction)loginClick:(id)sender;

@end
