//
//  RootViewController.m
//  Plist文件
//
//  Created by qianfeng on 14-9-12.
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
    NSArray *array =@[@"读取Plist文件",@"写入Plist文件"];
    for (int i =0; i<array.count ; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.frame =CGRectMake(30, 60+120*i, 200, 40);
        btn.titleLabel.font=[UIFont systemFontOfSize:25];
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag= 101+i;
        [self.view addSubview:btn];
        
    }

}
-(void)btnPress:(UIButton *)btn
{
    if (btn.tag==101)
    {
        //沙盒路径 ,取到当前应用程序的的家目录
        NSString *homePath =NSHomeDirectory();
        NSLog(@"%@",homePath);
        //取到当前应用程序的Documents
//        NSString *documentPath =[homePath stringByAppendingString:@"/Documents"];
//        NSLog(@"%@",documentPath);
//        
//        //应用程序的主资源路径 mainBundle 得到Plist文件.app的资源
//        //bundlePath 取到Plist文件.app的路径
//        NSString *mainBundlePath = [[NSBundle mainBundle] bundlePath];
//        NSLog(@"%@",mainBundlePath);
        
        //sandBox
        //NSBundle应用程序资源类，mainBundle表示当前应用程序的主要资源
        NSString * plistPath =[[NSBundle mainBundle] pathForResource:@"MyList" ofType:@"plist"];
        
        //取到主资源路径中，放在子文件中的资源
        NSString *picPath = [[NSBundle mainBundle] pathForResource:@"/images/17_1" ofType:@"jpg"];
        NSString *pic1Path = [[NSBundle mainBundle] pathForResource:@"17_1" ofType:@"jpg" inDirectory:@"images"];
       
        
        
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        
        
        NSString *name =[dict objectForKey:@"UserName"];
        NSString *password = [dict objectForKey: @"Password"];
        NSString *nickname = [dict objectForKey:@"NickName"];
        NSString *age=[dict objectForKey:@"Age"];
        
        NSLog(@"name = %@",name);
        NSLog(@"password = %@",password);
        NSLog(@"nickname = %@",nickname);
        NSLog(@"age = %@",age);
        
        NSArray *array = [dict objectForKey:@"OtherUser"];
        for (NSDictionary * dict in array) {
            NSLog(@"%@",dict);
        }
        
    }
    else if (btn.tag ==102)
    {
        NSArray *array =@[@"a",@"b",@"c",@"d"];
        NSDictionary *dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"one",@"1",@"two",@"2",@"three",@"3",array,@"cap", nil];
        //取到主主要路径
        NSString * mainBundlePath = [[NSBundle mainBundle]bundlePath];
        //合格完整的资源文件名
//        NSString * filePath1 = [NSString stringWithFormat:@"%@%@",mainBundlePath,@"/MyData.plist"];
//        NSLog(@"%@",filePath1);
        NSString *filePath =[mainBundlePath stringByAppendingString:@"/MyData.plist"];
        NSLog(@"%@",filePath);
        //将字典数据写入到plist文件
        BOOL res = [dict writeToFile:filePath atomically:YES];
        if (res ==YES)
        {
            NSLog(@"写入成功");
        }
        else{
        
            NSLog(@"写入失败");
        }

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
