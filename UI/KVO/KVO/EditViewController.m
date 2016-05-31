//
//  EditViewController.m
//  KVO
//
//  Created by qianfeng on 14-10-9.
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
    
     _tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 300, 44)];
     _tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_tf];
    _tf.text = [[LoginUserModel loginUser] nickName];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 130, 300, 44);
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)saveAction
{
//    [[LoginUserModel loginUser] setValue:_tf.text forKey:@"nickName"];  //或者下面的这中，不触发kvc ，就kvo就不知道
    LoginUserModel * model = [LoginUserModel loginUser];
    model.nickName = _tf.text;
    [self.view endEditing:YES];
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
