//
//  RootViewController.m
//  JSon解析
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
    [self createButtonWeb];
}
-(void)createButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 50, 150, 40);
    [btn setTitle:@"JSon解析" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)createButtonWeb
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 150, 150, 40);
    [btn setTitle:@"JSon解析网络数据" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPressWeb) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)btnPressWeb
{
    NSURL * url = [NSURL URLWithString:@"http://iappfree.candou.com:8080/free/applications/limited?%20currency=rmb&page=1"];
    NSMutableURLRequest *urlRequset = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    
    NSURLResponse * urlResponse = nil;
    NSError * error = nil;
    NSData * data = nil;
    
    data = [NSURLConnection sendSynchronousRequest:urlRequset returningResponse:&urlResponse error:&error];
   
    if (error==nil) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error==nil) {
            NSArray * array = [dict objectForKey:@"applications"];
            for (NSDictionary * dict1 in array) {
                NSString * name = [dict1 objectForKey:@"name"];
                NSLog(@"%@",name);
            }
        }
    }
}
-(void)btnPress
{
    //JSON格式 []表示一个数组
    //          {} 表示一个字典
    //      key ：value 表示字典中的一个键值对
    //       数组与数组之间，字典与字典之间用逗号隔开
    NSString *jsonStr =@"[{ \"firstName\": \"Brett\", \"lastName\":\"McLaughlin\", \"email\": \"aaaa\" }, { \"firstName\": \"Brett2\", \"lastName\":\"McLaughlin2\", \"email\": \"aaaa2\" }]";
    //通过UTF8String得到OC字符串以C字符串的表现形式
    const char *pJSon = [jsonStr UTF8String];
    //通过c语言的字符串得到一个oc的NSData对象
    NSData * jsondata = [[NSData alloc] initWithBytes:pJSon length:strlen(pJSon)];
    NSError * error = nil;
    //通过这个方法，解析OC的NSData对象中的数据，得到我们的JSon对象
    //nsdata中存放的数据存放的数据必须是json格式的数据
    //参数3：解析出错则错误信息保存在参数3中
    //通过这个方法得到的对象只能是数组或者字典
    NSArray * array = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&error];
    //解析成功
    if (error==nil) {
        for (NSDictionary *dict in array) {
            NSLog(@"%@",[dict objectForKey:@"firstName"]);
            NSLog(@"%@",[dict objectForKey:@"lastName"]);
            NSLog(@"%@",[dict objectForKey:@"email"]);
        }
    }
    
    
    NSDictionary *dict =@{@"one":@"1",@"two":@"2",@"three":@"3"};
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
