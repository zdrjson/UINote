//
//  EditViewController.m
//  Sunday_10.12_kvo
//
//  Created by qianfeng on 14-10-12.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "EditViewController.h"
#import "LoginUserModel.h"
@interface EditViewController ()
{
    UITextField * _tf;
}
@end

@implementation EditViewController

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
    // Do any additional setup after loading the view.
    [self createTextField];
    [self createButton];
}
-(void)createTextField
{
    _tf = [[UITextField alloc] init];
    _tf.frame = CGRectMake(50, 50, 150, 50);
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_tf];
}
-(void)createButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 120, 300, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnClick
{
//    [_tf resignFirstResponder];
    LoginUserModel * model = [LoginUserModel loginUser];
    model.nickName = _tf.text;
    [_tf endEditing:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
