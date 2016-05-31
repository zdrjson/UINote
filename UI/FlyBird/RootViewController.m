//
//  RootViewController.m
//  FlyBird
//
//  Created by qianfeng on 14-10-27.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    NSTimer * _timer1;
    NSTimer * _timer2;
    NSTimer * _timer3;
    NSTimer * _timer4;
    
    UIImageView * _topCloudImageView;
    UIImageView * _middleCloudImageView;
    UIImageView * _bottomCloudImageView;
    UIImageView * _PlaneImageView;
}
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
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0.4 blue:1 alpha:1];
    
    [self createTopCloud];
    [self createMiddleCloud];
    [self createBottomCloud];
    [self createPlane];
    [self createTimer];
    
}

-(void)createTimer
{
    _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timer1Action) userInfo:nil repeats:YES];
    _timer2 = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(timer2Action) userInfo:nil repeats:YES];
    _timer3 = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(timer3Action) userInfo:nil repeats:YES];
    _timer4 = [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(timer4Action) userInfo:nil repeats:YES];
}
-(void)timer4Action
{
     NSArray * arr =@[@"plane2",@"plane1",@"plane7",@"plane9",@"plane4"];
    
    if (_PlaneImageView.frame.origin.x<-460) {
        _PlaneImageView.frame = CGRectMake(460, 100, 460, 120);
    }
    CGRect rect = _PlaneImageView.frame;
    rect.origin.x-=2;
    _PlaneImageView.frame = rect;
}
-(void)timer3Action
{


}
-(void)timer2Action
{
   
    if (_middleCloudImageView.frame.origin.x<-320) {
        _middleCloudImageView.frame = CGRectMake(400, 200, 320, 100);
    }
    CGRect rect = _middleCloudImageView.frame;
    rect.origin.x-=4;
    _middleCloudImageView.frame =rect;
    
}
-(void)timer1Action
{
    if (_topCloudImageView.frame.origin.x<-320) {
        _topCloudImageView.frame = CGRectMake(320, 0, 320, 70);
    }
    CGRect rect = _topCloudImageView.frame;
    rect.origin.x-=3;
    _topCloudImageView.frame=rect;
}
-(void)createPlane
{
    _PlaneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(460, 100, 460, 120)];
    _PlaneImageView.image = [UIImage imageNamed:@"plane6"];
    [self.view addSubview:_PlaneImageView];
}
-(void)createMiddleCloud
{
    _middleCloudImageView = [[UIImageView alloc] initWithFrame:CGRectMake(400, 200, 320, 100)];
    _middleCloudImageView.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:_middleCloudImageView];
}
-(void)createBottomCloud
{
    
}
-(void)createTopCloud
{
    _topCloudImageView = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 70)];
    _topCloudImageView.image = [UIImage imageNamed:@"cloud"];
    [self.view addSubview:_topCloudImageView];
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
