//
//  RootViewController.m
//  Friday5_9.19
//
//  Created by qianfeng on 14-9-20.
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
    [self createButtonWeb];
}
-(void)createButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem ];
    btn.frame = CGRectMake(30, 40, 150, 120);
    [btn setTitle:@"JSon解析" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)createButtonWeb
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem ];
    btn.frame = CGRectMake(30, 150, 300, 120);
    [btn setTitle:@"JSon解析网络数据" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPressWeb) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnPressWeb
{
    
    NSURL *url = [NSURL URLWithString:@"http://iappfree.candou.com:8080/free/applications/limited?%20currency=rmb&page=1"];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    NSURLResponse * urlResponse = nil;

    NSError * error = nil;
    
    NSData * data = nil;
    
    data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:&error];
    if (error==nil) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error==nil) {
            NSArray * array = [dict objectForKey:@"applications"];
            for (NSDictionary * dict1 in array) {
                NSLog(@"%@",[dict1 objectForKey:@"name"]);
            }
        
        }
    }
    
    
}
-(void)btnPress
{
    NSString * jsonStr = @"[{ \"firstName\": \"Brett\", \"lastName\":\"McLaughlin\", \"email\": \"aaaa\" }, { \"firstName\": \"Brett2\", \"lastName\":\"McLaughlin2\", \"email\": \"aaaa2\" }]";
    const char * pJSon = [jsonStr UTF8String];
    
    NSData *jsondata = [[NSData alloc] initWithBytes:pJSon length:strlen(pJSon)];
    
    NSError * error = nil;
    
    NSArray * array = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&error];
    
    if (error==nil) {
        for (NSDictionary * dict in array) {
            NSLog(@"%@",[dict objectForKey:@"firstName"]);
            NSLog(@"%@",[dict objectForKey:@"lastName"]);
            NSLog(@"%@",[dict objectForKey:@"email"]);
        }
    }
    
    NSDictionary * dict = @{@"one": @"1",@"two":@"2",@"three":@"3"};
    NSData * dictData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSDictionary * dict1 = [NSJSONSerialization JSONObjectWithData:dictData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"%@",dict1);
    
    
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
