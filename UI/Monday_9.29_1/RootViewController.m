//
//  RootViewController.m
//  Monday_9.29_1
//
//  Created by qianfeng on 14-9-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#define __string(__str__)  NSString * __str__

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
//    NSString *picPath =[[NSBundle mainBundle] pathForResource:@"/images/17_1" ofType:@"jpg"];
//    NSString * picPath1 = [[NSBundle mainBundle] pathForResource:@"17_1" ofType:@"jpg" inDirectory:@"images"];
    
//    NSLog(@"picPath is %@",picPath1);
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"MyList" ofType:@"plist"];
    NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
//    NSLog(@"%@",dict);
//    NSString * age = dict[@"Age"];
//    NSString * nickName = dict[@"NickName"];
//    NSString * password = dict[@"password"];
//    NSString * UserName = dict[@"UserName"];
//    __string(age) = dict [@"Age"];
//    __string(nickName) = dict[@"NickName"];
//    __string(password) = dict[@"password"];
//    __string(userName) = dict[@"UserName"];
//    
    NSArray * array = dict[@"OtherUser"];
    for (NSDictionary * dict in array) {
        NSLog(@"%@",dict);
    }
    NSArray * array1 = @[@"a",@"b",@"c",@"d"];
    NSDictionary * dict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"one",@"1",@"two",@"2",@"three",@"3",array1,@"array", nil];
    NSString * mainBundlePath = [[NSBundle mainBundle] bundlePath];
    NSLog(@"%@",mainBundlePath);
    NSString * filePath = [mainBundlePath stringByAppendingString:@"/MyData.plist"];
    NSLog(@"%@",filePath);
    BOOL res = [dict1 writeToFile:filePath atomically:YES];
    NSLog(@"%d",res);
    
    NSDictionary * dict2 = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSLog(@"%@",dict2);
    NSString * documentPath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    NSLog(@"%@",documentPath);
    
    
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
