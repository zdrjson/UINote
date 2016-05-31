//
//  RegisterViewController.m
//  iChat
//
//  Created by qianfeng on 14-10-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RegisterViewController.h"
#import "ChatEngine.h"
@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *nickNameText;//写在.m文件中外面用不了

@end

@implementation RegisterViewController

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(registerAction)];
}
-(void)registerAction
{
    UserModel * user = [[UserModel alloc] init];
    user.username = _userNameText.text;
    user.userpassword  =_passWord.text;
    user.usernickname = _nickNameText.text;
    
    [[ChatEngine sharedEngine] registerWithUser:user failed:^(NSString * msg, BOOL ok) {
        if (ok) {
            [self.navigationController popViewControllerAnimated:YES];//写两个
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
    }];
    return;

//    NSString * url  = [__kHOST stringByAppendingString:__kREGISTER];
    NSString * username = _userNameText.text;
//    NSString * password = _passWord.text;
//    NSString * nickname = _nickNameText.text;
    if (!username||username.length==0) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:@"用户名不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return;
    }
    NSString * checkUrl = [NSString  stringWithFormat:@"%@checkusername.php?username=%@",__kHOST,username];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{//检查用户名是否存在
        NSString * res = [NSString stringWithContentsOfURL:[NSURL URLWithString:checkUrl] encoding:NSUTF8StringEncoding error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([res isEqualToString:@"0"]) {
                [self userNameExists];
//                NSLog(@"用户名已经存在");
            }
            else
            {
                [self reg];
//                NSLog(@"用户名不存在,可以注册");
            }
        });
    });
    
}
-(void)userNameExists
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:@"用户名已经存在" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    //@selector(registerWithName:withPwd:withNickName:);//方法签名(是唯一的),唯一标识
}
-(void)reg
{
    NSString * url  = [__kHOST stringByAppendingString:__kREGISTER];
    NSString * username = _userNameText.text;
    NSString * password = _passWord.text;
    NSString * nickname = _nickNameText.text;
    
    NSString * getUrl = [NSString stringWithFormat:@"%@?username=%@&password=%@&nickname=%@",url,username,password,nickname];
    NSLog(@"%@",getUrl);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString * res = [NSString stringWithContentsOfURL:[NSURL URLWithString:getUrl] encoding:NSUTF8StringEncoding error:nil];
       dispatch_async(dispatch_get_main_queue(), ^{
           if ([res isEqualToString:@"0"])
           {
               NSLog(@"注册失败");
           }
           else
           {
               NSLog(@"注册成功");
               [self.navigationController popViewControllerAnimated:YES];//写两个
               [self dismissViewControllerAnimated:YES completion:nil];
           }
       });
    });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
