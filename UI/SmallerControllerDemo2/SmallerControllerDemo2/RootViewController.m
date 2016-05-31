//
//  RootViewController.m
//  SmallerControllerDemo2
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
    [self createProgressView];
    [self createSwitch];
    [self createSlider];
}
-(void)createSlider
{
    //创建一个滑动条控件视图
    //默认情况下，slider中值得可变范围为0-1
    UISlider *slider =[[UISlider alloc] init];
    //这个高度不影响滑动条中间的可滑动部分，把高度可设为0，但点不到了
    slider.frame = CGRectMake(40, 200, 250, 10);
    //slider.backgroundColor = [UIColor redColor];
    //设置滑动条的最大值
    slider.maximumValue = 100;
    //设置滑动条的最小值
    slider.minimumValue = 0;
    //设置滑动条的当前的默认值
    slider.value = 30;
    //设置滑动条滑动过的轨迹颜色
    slider.tintColor = [UIColor redColor];
    //设置滑动条最小值一侧的颜色
    slider.minimumTrackTintColor = [UIColor yellowColor];
    //设置滑动条最大值一侧的颜色
    slider.maximumTrackTintColor = [UIColor blueColor];
    //设置最大值和最小值一侧的图片
    slider.maximumValueImage = [UIImage imageNamed:@"sliderMax.png"];
    slider.minimumValueImage = [UIImage imageNamed:@"sliderMin.png"];
    //设置滑动条最大值一侧滑动轨迹图片
    [slider setMaximumTrackImage:[UIImage imageNamed:@"sliderRight"] forState:UIControlStateNormal];
    //设置滑动条最小值一侧滑动轨迹图片
    [slider setMinimumTrackImage:[UIImage imageNamed:@"sliderLeft"] forState:UIControlStateNormal];
    
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];

}
-(void)sliderValueChanged:(UISlider *)slider
{
    NSLog(@"%f",slider.value);

}
-(void)createSwitch
{
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(40, 140, 0, 0)];
    [sw addTarget:self action:@selector(switchValueChanged:)  forControlEvents:UIControlEventTouchUpInside];//???
    [self.view addSubview:sw];
}
-(void)switchValueChanged:(UISwitch *)sw
{
    if (sw.isOn)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    }
    else
    {
        [_timer invalidate];
    
    }

}
-(void)updateTimer
{
    UIProgressView * progress =(UIProgressView *)[self.view viewWithTag:101];
    if (progress.progress==1) {
        progress.progress=0;
    }
    [UIView animateWithDuration:0.1 animations:^{
        progress.progress+=0.1;
    }];
    

}
-(void)createProgressView
{
    //创建进度条，高度值设置无效
    UIProgressView *progress =[[UIProgressView alloc] initWithFrame:CGRectMake(20, 80, 250, 100)];
    //背景颜色无效
    progress.backgroundColor = [UIColor redColor];
    //设置进度条当前进度
//    progress.progress= 0.5;
    //设置进度条已经完成的进度部分的颜色
    progress.tintColor = [UIColor redColor];
    progress.progressTintColor = [UIColor redColor];
    //设置进度条轨道的颜色
    progress.trackTintColor = [UIColor blackColor];
    //设置背景图片
    progress.trackImage = [UIImage imageNamed:@"header_bg"];
    progress.tag = 101;
    [self.view addSubview:progress];

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
