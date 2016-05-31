//
//  RootViewController.m
//  Thursday_10.9_权限管理
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "MyLabel.h"
@interface RootViewController ()

@end

@implementation RootViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"d");
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"a");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * view = [[UIView alloc] init];
    view.frame = CGRectMake(10, 20, 300, 440);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    NSArray *lableTitle = @[@"功能",@"权限"];
    for (int i = 0; i<2; i++) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0+150*i, 0, 150, 40)];
        label.text = lableTitle[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:30];
        [view addSubview:label];
    }
    
//    for (int i = 0;i<20;i++)
//    {
//        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        btn.frame = CGRectMake(0, 20*i+40,150 , 20);
//        [btn setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont systemFontOfSize:25];
//        [view addSubview:btn];
//    }
    for (int i = 0; i<20; i++) {
        MyLabel * label = [[MyLabel alloc] initWithFrame:CGRectMake(0, 20*i+40, 150, 20)];
        label.text = @"0";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:25];
        [label addTarget:self action:@selector(labelClick:)];
        label.tag = 100+i;
        [view addSubview:label];
    }
    
}
-(void)labelClick:(MyLabel *)label
{
    MyLabel * myLabel = (MyLabel *)[self.view.subviews[0] viewWithTag:label.tag];
    myLabel.text = [NSString stringWithFormat:@"%d",0|(1<<(label.tag-100))];
    NSLog(@"%d",0|(1<<(label.tag-100)));
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
