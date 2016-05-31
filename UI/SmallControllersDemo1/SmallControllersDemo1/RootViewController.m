//
//  RootViewController.m
//  SmallControllersDemo1
//
//  Created by qianfeng on 14-9-16.
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
    self.view.backgroundColor = [UIColor redColor];
    [self createStepper];
    [self createSegemtedControl];
    [self createActivityIndicatorView];
    
}
-(void)createActivityIndicatorView
{
    //创建活动状态指示视图
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] init];
    //frame的大小不会影响指示视图中转动的视图的大小
    indicatorView.frame = CGRectMake(20, 200, 100, 100);
    indicatorView.backgroundColor = [UIColor whiteColor];
    //设置活动指示视图的风格
    indicatorView.activityIndicatorViewStyle =UIActivityIndicatorViewStyleGray;
   // [indicatorView startAnimating];
    indicatorView.tag = 101;
    [self.view addSubview:indicatorView];


}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    static BOOL isON = YES;
    UIActivityIndicatorView * indView =(UIActivityIndicatorView *)[self.view viewWithTag:101];
    if (isON==YES)
    {
        [indView startAnimating];
    }
    else
    {
        [indView stopAnimating];
    }
    isON =!isON;
}
-(void)createSegemtedControl
{
    //创建一个分段控制器
    UISegmentedControl *segmentCtrl = [[UISegmentedControl alloc ]init];
    segmentCtrl.frame = CGRectMake(20, 150, 250, 50);
   // segmentCtrl.backgroundColor = [UIColor redColor];
    //往分段控制器中插入某一段到指定位置
    [segmentCtrl insertSegmentWithTitle:@"5元" atIndex:0 animated:YES];
    [segmentCtrl insertSegmentWithTitle:@"10元" atIndex:1 animated:YES];
    [segmentCtrl insertSegmentWithTitle:@"15元" atIndex:2 animated:YES];
    [segmentCtrl insertSegmentWithTitle:@"30元" atIndex:0 animated:YES];
    //设置分段控制器初始的选中状况
    segmentCtrl.selectedSegmentIndex = 0;
    [segmentCtrl addTarget:self action:@selector(segmentValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentCtrl];

}
-(void)segmentValueChange:(UISegmentedControl *)segCtrl
{
    //打印当前用户选中的分段
    NSLog(@"%d",segCtrl.selectedSegmentIndex);

}
-(void)createStepper
{
    //创建一个步进器
    UIStepper *stepper = [[UIStepper alloc]init];
    //步进器的宽度和高度的设置无效
    stepper.frame = CGRectMake(50, 50, 0, 0);
    //stepper.backgroundColor = [UIColor blueColor];
    //设置步进器每一次步进的数值
    stepper.stepValue = 3;
    //设置步进器的最大数值
    stepper.maximumValue = 20;
    //设置步进器的最小数值
    stepper.minimumValue = -10;
    //设置步进器的当前数值
    stepper.value = 10;
    [stepper addTarget:self action:@selector(stepperClicked:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];


}
-(void)stepperClicked:(UIStepper *)step
{
    NSLog(@"%f",step.value);

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
