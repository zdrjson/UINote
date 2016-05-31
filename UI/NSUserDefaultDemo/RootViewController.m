//
//  RootViewController.m
//  NSUserDefaultDemo
//
//  Created by qianfeng on 14-9-15.
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
    
    [self createButtons];
}
-(void)createButtons
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"写入数据" forState:UIControlStateNormal];
    btn.frame = CGRectMake(30, 50, 200, 40);
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnWriteData) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    UIButton * btn1 =[UIButton buttonWithType: UIButtonTypeCustom];
    [btn1 setTitle:@"读取数据" forState:UIControlStateNormal];
    btn1.frame =CGRectMake(30, 120, 200, 40);
    btn1.backgroundColor = [UIColor blackColor];
    [btn1 addTarget:self action:@selector(btnReadData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
}
-(void)btnWriteData
{
    //单例方法的前缀，share default standard
    //NSUserDefaults 相当于默认的plist文件类
    //NSUserDefaults 会在第一个次使用时创建一个plist文件，这个文件的位置在沙盒中
    //这个创建的plist，名称我们不知道，也不需要关心
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    //往def中（def所代表的plist文件中写入数据）
    [def setObject:@"aaa" forKey:@"KEY_AAA"];
    [def setObject:@"bbb" forKey:@"KEY_BBB"];
    
    //同步数据，将数据真正写入到plist文件中
     BOOL res = [def synchronize];
    if (res==YES) {
        NSLog(@"写入成功");
    }
    else{
        NSLog(@"写入失败");
    }
//    NSString *homePath = NSHomeDirectory();
//    NSLog(@"%@",homePath);

}
-(void)btnReadData
{
    //从def中读取原来写入到默认的plist文件中的数据
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *straaa = [def objectForKey:@"KEY_AAA"];
    NSLog(@"%@",straaa);
    
    NSString *strbbb = [def objectForKey:@"KEY_BBB"];
    NSLog(@"%@",strbbb);
    

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
