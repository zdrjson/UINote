//
//  V2ViewController.m
//  Thursday_10.16
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "V2ViewController.h"
#import "V1ViewController.h"
@interface V2ViewController ()

@end

@implementation V2ViewController

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
    NSArray * titleArray = @[@"红色",@"绿色"];
    for (int i =0 ; i<2; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(60+i*60, 60, 60, 60);
        btn.backgroundColor = [UIColor brownColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.tag = 101+i;
        [self.view addSubview:btn];
    }
    
    
}
-(void)btnClick:(UIButton *)btn
{
    UIColor * c = nil;
    NSString * s = nil;
    if (btn.tag==101) {
        c=[UIColor redColor];
        s = @"红色";
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeTheme" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:c,@"Color",s,@"Title",nil]];
//        [_delegate changeColor:[UIColor redColor]];
//        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(btn.tag ==102)
    {
        c= [UIColor greenColor];
        s = @"绿色";
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeTheme1" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:c,@"Color",s,@"Title",nil]];
//        _greenChange([UIColor greenColor]);
        
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
