//
//  ViewController.m
//  HttpDemo
//
//  Created by qianfeng on 14-10-11.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "QFURLConnection.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL * url = [NSURL URLWithString:@"http://192.168.88.8/sns/my/user_list.php"];
//    NSURLRequest * r =[NSURLRequest requestWithURL:url];
////    NSURLConnection * c =[[NSURLConnection alloc] initWithRequest:r delegate:self];
    QFURLConnection * c = [[QFURLConnection alloc] initWithUrl:url delegate:self];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
