//
//  ViewController.m
//  Saturday_11.1_FlyBird
//
//  Created by qianfeng on 14-11-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "GameEngine.h"
@interface ViewController ()
{
    UIImageView * _planeView;
    UIImageView * _cloudView;
    
    UIScrollView * _birdView;
    CGFloat _speed;
    
    NSMutableArray * _wallArray;
    UIButton * _restartButton;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self uiConfig];
    [self animateConfig];
}
//给所有的控件做初始化
-(void)uiConfig
{
    _wallArray = [NSMutableArray array];
    self.view.backgroundColor = [UIColor colorWithRed:0.51f green:0.67f blue:0.95f alpha:1.00f];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    
    _restartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _restartButton.frame = CGRectMake(0, 220, 320, 60);
    [_restartButton setTitle:@"重新开始" forState:UIControlStateNormal];
    _restartButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9];
    _restartButton.hidden = YES;
    [_restartButton addTarget:self action:@selector(restartAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_restartButton];
    
    _cloudView = [[UIImageView alloc] initWithFrame:CGRectMake(320, 100, 384/3, 71)];
    UIImage * cloudImg = [UIImage imageNamed:@"cloud"];
    _cloudView.image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(cloudImg.CGImage, CGRectMake(0, 0, 384/3*2, 71*2))];
    [self.view addSubview:_cloudView];

    _planeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plane1"]];//想要保持原图的大小用initWithImage
    _planeView.center = CGPointMake(320, 100);
    [self.view addSubview:_planeView];
    
    _birdView = [[UIScrollView alloc] initWithFrame:CGRectMake(80, 150, 252/7, 24)];
    UIImageView * imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flappy_fly"]];
//    NSLog(@"%@",NSStringFromCGRect(imgv.frame));
    [_birdView addSubview:imgv];
    [self.view addSubview:_birdView];
    
    
    
}
-(void)animateConfig
{
    [[GameEngine sharedEngine] addAnimate:^{
        _planeView.center = CGPointMake(_planeView.center.x-3, _planeView.center.y);
        if (_planeView.center.x<-_planeView.frame.size.width/2) {
            UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"plane%d",(arc4random()%11)+1]];
            _planeView.image = img;
            _planeView.frame =CGRectMake(400, arc4random()%100+100, img.size.width, img.size.height);
        }
    } withTime:2 withName:@"plane"];
    [[GameEngine sharedEngine] addAnimate:^{
        _cloudView.center = CGPointMake(_cloudView.center.x-2, _cloudView.center.y);
        if (_cloudView.center.x<-_cloudView.frame.size.width/2) {
            _cloudView.center = CGPointMake(400, (arc4random()%100)+50);
        }
    } withTime:3 withName:@"cloud"];
    //鸟自身飞
    [[GameEngine sharedEngine] addAnimate:^{
        int contentOffsetX = _birdView.contentOffset.x+36;
        contentOffsetX = contentOffsetX>252/7*6?0:contentOffsetX;
        _birdView.contentOffset = CGPointMake(contentOffsetX, 0);
    } withTime:2 withName:@"fly"];
    //鸟上下飞
    [[GameEngine sharedEngine] addAnimate:^{
        _birdView.center = CGPointMake(_birdView.center.x, _birdView.center.y+_speed);
        _speed+=0.05;
    } withTime:1 withName:@"flyAnimate"];
    [[GameEngine sharedEngine] setValid:NO withName:@"flyAnimate"];
    
    [[GameEngine sharedEngine] addAnimate:^{
        for (int i = _wallArray.count-1; i>=0; i--) {
            UIImageView * imgv = _wallArray[i];
            imgv.center = CGPointMake(imgv.center.x-3, imgv.center.y);
            if (imgv.center.x<-40) {
                [imgv removeFromSuperview];
                [_wallArray removeObject:imgv];
            }
        }
        UIImageView * lastImageView = _wallArray.lastObject;
        if (_wallArray.count==0||lastImageView.center.x<(arc4random()%100)+100) {
            [self addWalls];
        }
    } withTime:2 withName:@"wall"];
    [[GameEngine sharedEngine] setValid:NO withName:@"wall"];
    
    [[GameEngine sharedEngine] addAnimate:^{
        for (UIImageView * imgv in _wallArray) {
            if (CGRectIntersectsRect(_birdView.frame, imgv.frame)) {
                [self gameOver];
            }
        }
    } withTime:1 withName:@"gameover"];
    
}
-(void)gameOver
{
   
    [[GameEngine sharedEngine] gameOver];
    [self.view bringSubviewToFront:_restartButton];
    _restartButton.hidden = NO;
}
-(void)restartAction
{
    _restartButton.hidden = YES;
    _birdView.center = CGPointMake(80, 150);
    for (UIImageView * imgv in _wallArray) {
        [imgv removeFromSuperview];
    }
    [_wallArray removeAllObjects];
    [[GameEngine sharedEngine] setValid:NO withName:@"flyAnimate"];
    [[GameEngine sharedEngine] setValid:NO withName:@"wall"];
    [[GameEngine sharedEngine] restart];
}
-(void)addWalls
{
    UIImageView * topWall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top_wall"]];
    UIImageView * bottomWall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom_wall"]];
    CGFloat y = arc4random()%200;
    topWall.center = CGPointMake(450, y-200);
    bottomWall.center = CGPointMake(450, 600+topWall.center.y);
    [self.view addSubview:topWall];
    [self.view addSubview:bottomWall];
    
    [_wallArray addObject:topWall];
    [_wallArray addObject:bottomWall];
}
-(void)tapAction
{
    _speed = -3;
    [[GameEngine sharedEngine] setValid:YES withName:@"flyAnimate"];
    [[GameEngine sharedEngine] setValid:YES withName:@"wall"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
