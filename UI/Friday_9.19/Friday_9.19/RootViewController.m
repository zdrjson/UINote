//
//  RootViewController.m
//  Friday_9.19
//
//  Created by qianfeng on 14-9-19.
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
    [self createButton];
    
}
-(void)createButton
{

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 40, 150, 50);
    [btn setTitle:@"点击下载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
}
-(void)btnPress
{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest * urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSError * error = nil;
    
    NSURLResponse *urlresponse = nil;
    
    NSData *data = nil;
    
    data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlresponse error:&error];
    
    if (error==nil) {
        NSLog(@"urlresponse = %@",urlresponse);
        NSString * html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"html = %@",html);
    }
    else
    {
        NSLog(@"error = %@",error);
    }
    
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
