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
    self.view.backgroundColor = [UIColor grayColor];
    [self createtextFile];
}
-(void)createtextFile
{
    UITextField *textFile =[[UITextField alloc] init];
    textFile.frame = CGRectMake(20, 30, 200, 40);
    textFile.backgroundColor = [UIColor whiteColor];
    textFile.borderStyle = UITextBorderStyleRoundedRect;
    textFile.placeholder = @"请输入用户名";
    //textFile.secureTextEntry= YES;
//    textFile.text = @"zz";
//    NSString *content = textFile.text;
//    NSLog(@"%@",content);
    textFile.textAlignment = NSTextAlignmentCenter;
    textFile.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    textFile.textColor = [UIColor magentaColor];
    
    UIView * leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 100)];
    leftView.backgroundColor =[UIColor redColor];
    textFile.leftView = leftView;
    textFile.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *rightView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 200)];
    rightView.backgroundColor = [UIColor blackColor];
    textFile.rightView = rightView;
    //textFile.rightViewMode = UITextFieldViewModeWhileEditing;
    
    
//    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    inputView.backgroundColor = [UIColor lightGrayColor];
//    textFile.inputView = inputView;
    
    textFile.clearButtonMode = UITextFieldViewModeAlways;
    
    textFile.clearsOnBeginEditing = YES;
    
    textFile.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    textFile.contentVerticalAlignment = UIControlContentHorizontalAlignmentFill;
    
    textFile.font= [UIFont systemFontOfSize:25];
    
    textFile.minimumFontSize = 25;
    
    textFile.adjustsFontSizeToFitWidth = 20;
    
    textFile.keyboardType = UIKeyboardTypeNamePhonePad;
    textFile.keyboardAppearance = UIKeyboardAppearanceAlert;
    textFile.returnKeyType = UIReturnKeyGoogle;
    [self.view addSubview:textFile];
    
    
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
