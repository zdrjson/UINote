//
//  LoginViewController.m
//  Sunday_11.2_ChatDemo
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "LoginViewController.h"
#import "QFXmppManager.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _usernameField.text = @"zdrzdrzdrzdrzdr@1000phone.net";
    _passwordField.text = @"123456";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)regClick:(id)sender {
    //初始化 注册
    [[QFXmppManager shareInstance] registerUser:self.usernameField.text withPasswordFeild:self.passwordField.text withCompletion:^(BOOL ret,NSError * error){
        if (ret) {
            NSLog(@"注册成功");
        }
        else
        {
            NSLog(@"注册失败:%@",error);
        }
    }];

}

- (IBAction)loginClick:(id)sender {
    [[QFXmppManager shareInstance] loginUser:self.usernameField.text withPasswordFeild:self.passwordField.text withCompletion:^(BOOL ret,NSError * error){
        if (ret) {
            NSLog(@"登录成功");
        }
        else
        {
            NSLog(@"登录失败:%@",error);
        }
    }];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];
}
@end
