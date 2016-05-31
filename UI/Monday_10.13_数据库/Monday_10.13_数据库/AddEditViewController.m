//
//  AddEditViewController.m
//  Monday_10.13_数据库
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AddEditViewController.h"

@interface AddEditViewController ()
{
    BOOL _isAdd;
}
@end

@implementation AddEditViewController

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
    _isAdd=_model==nil;
    self.title = !_isAdd?@"修改":@"增加";
    [_addButton setTitle:self.title forState:UIControlStateNormal];
    if (!_isAdd) {
        _userNameText.text = _model.userName;
        _phoneNumberText.text = _model.phoneNumber;
    }
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addAction:(id)sender {
    if (_isAdd) {
        _model = [[UserModel alloc] init];
    }
   
    if (![_userNameText.text isEqualToString:@""] &&![_phoneNumberText.text isEqualToString:@""])
    {
        _model.userName = _userNameText.text;
        _model.phoneNumber = _phoneNumberText.text;
        _addcb();
        [self.navigationController popViewControllerAnimated:YES];
    }
   
    
}
@end
