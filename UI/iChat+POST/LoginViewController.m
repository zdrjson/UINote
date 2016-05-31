//
//  LoginViewController.m
//  iChat
//
//  Created by qianfeng on 14-10-30.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "LoginViewController.h"
#import "ChatEngine.h"
@interface LoginViewController () <NSURLConnectionDataDelegate>
{
    NSMutableData * _data;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

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
    self.title = @"登录";
    _userNameText.text = @"911";
    _passwordText.text = @"1199";
    _data = [[NSMutableData alloc] init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(loginAction)];
    
}
//get请求：不安全，参数在url地址中，参数的长度不能大于1024字节 （安全//不修改服务器数据）
//post请求，安全，参数都是封装在data里的，参数长度不限，（一般4g以内）//上传数据
-(void)loginActionPost
{
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",__kHOST,__kLOGIN];
    
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [req setHTTPMethod:@"POST"];
    NSString * str = [NSString stringWithFormat:@"username=%@&password=%@",_userNameText.text,_passwordText.text];
    
    NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [req setHTTPBody:data];
    [NSURLConnection connectionWithRequest:req delegate:self];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString * str = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
}

-(void)loginAction
{
    UserModel * user = [[UserModel alloc] init];
    user.username = _userNameText.text;
    user.userpassword = _passwordText.text;
    
    [[ChatEngine sharedEngine] loginWithUser:user message:^(NSString * msg, BOOL ok) {
        if (ok) {
            [self.navigationController popViewControllerAnimated:YES];
            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"登陆成功");
        }
        else
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
