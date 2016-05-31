//
//  RootViewController.m
//  Sunday_9.14
//
//  Created by qianfeng on 14-9-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    self.view.backgroundColor = [UIColor redColor];
    [self createTextFiled];
    [self createButtons];
    [self createNotfication];
}
-(void)createTextFiled
{
    UITextField * textFiled = [[UITextField alloc ]initWithFrame:CGRectMake(20, 30, 200, 50)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    textFiled.clearButtonMode = UITextFieldViewModeAlways;
    textFiled.placeholder = @"请输入用户名";
   //[textFiled becomeFirstResponder];
    textFiled.tag = 101;
    textFiled.delegate = self;
    [self.view addSubview:textFiled];
    
    UIControl * control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [control addTarget:self action:@selector(controlPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control];
    [self.view sendSubviewToBack:control];
//    [self.view bringSubviewToFront:control];
    
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor = [UIColor blueColor];
    textFiled.inputAccessoryView = view;
    
    

}
-(void)createNotfication
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardWillShow:(NSNotification *)not
{
    NSDictionary * dict = not.userInfo;
    NSString * timerStr = [dict objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[timerStr floatValue]];
    for (int i =0; i<2; i++) {
        UIButton *btn =(UIButton *)[self.view viewWithTag:1001+i];
        btn.frame= CGRectMake(100+70*i, 100, 50, 50);
    }
    [UIView commitAnimations];

}
-(void)keyboardWillHide:(NSNotification *)not
{
   // NSLog(@"%@",[not.userInfo allKeys]);
    NSDictionary * dict = not.userInfo;
    NSString * timerStr = [dict objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[timerStr floatValue]];
    for (int i =0; i<2; i++) {
        UIButton *btn =(UIButton *)[self.view viewWithTag:1001+i];
        btn.frame= CGRectMake(100+70*i, 200, 50, 50);
    }
    [UIView commitAnimations];

    

}
-(void)createButtons
{
    NSArray * array = @[@"登入",@"注册"];
    for (int i = 0;i<array.count; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(100+70*i, 200, 50, 50);
        btn.tag=1001+i;
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
    }
}

-(void)controlPress
{
    UITextField *textField =(UITextField *) [self.view viewWithTag:101];
    [textField resignFirstResponder];

}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@",NSStringFromSelector(_cmd));

}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"%@",NSStringFromSelector(_cmd));

    return YES;

}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{

    NSLog(@"%@",NSStringFromSelector(_cmd));

    return YES;

}
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"%@",NSStringFromSelector(_cmd));

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"%@",NSStringFromSelector(_cmd));
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField *textFiled = (UITextField *)[self.view viewWithTag:101];
    [textFiled resignFirstResponder];

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
