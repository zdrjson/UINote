//
//  ViewController.m
//  Monday_10.27_FlyBird
//
//  Created by qianfeng on 14-10-27.
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
-(void)uiConfig
{
    _wallArray = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor colorWithRed:0.51f green:0.67f blue:0.95f alpha:1.00f];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    _restartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _restartButton.frame = CGRectMake(0, 220, 320, 60);
    [_restartButton setTitle:@"重新开始" forState:UIControlStateNormal];
    _restartButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9];
    [_restartButton addTarget:self action:@selector(restartAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_restartButton];
    _restartButton.hidden  = YES;
    _cloudView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 100, 384/3, 71)];
    UIImage * cloudImage = [UIImage imageNamed:@"cloud"];
    _cloudView.image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(cloudImage.CGImage, CGRectMake(0, 0, 383/3*2, 71*2))];
    [self.view addSubview:_cloudView];
    
    _planeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"plane%d",(arc4random()%11)+1]]];
    _planeView.center = CGPointMake(400, 100);
    [self.view addSubview:_planeView];
    
    _birdView = [[UIScrollView alloc] initWithFrame:CGRectMake(80, 150, 252/7, 24)];
    UIImageView * birdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flappy_fly"]];
    [_birdView addSubview:birdImageView];
    [self.view addSubview:_birdView];
    
}
-(void)restartAction
{
    _restartButton.hidden = YES;
    [[GameEngine sharedManager] restart];
    _birdView.center = CGPointMake(80, 150);
    for (UIImageView * imgv in _wallArray) {
        [imgv removeFromSuperview];
    }
    [_wallArray removeAllObjects];
    [[GameEngine sharedManager] setValid:NO withName:@"flyAnimate"];
    [[GameEngine sharedManager] setValid:NO withName:@"wall"];
    
}
-(void)animateConfig
{
    [[GameEngine sharedManager] addAnimate:^{
        _planeView.center = CGPointMake(_planeView.center.x-3, _planeView.center.y);
        if (_planeView.center.x<-_planeView.frame.size.width/2) {
            UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"plane%d",(arc4random()%11)+1]];
            _planeView.image = img;
            _planeView.frame = CGRectMake(350, 50+(arc4random()%100), img.size.width, img.size.height);
        }
    } withTime:2 withName:@"plane"];
    
    [[GameEngine sharedManager] addAnimate:^{
        _cloudView.center = CGPointMake(_cloudView.center.x-(arc4random()%5+5), _cloudView.center.y);
        if (_cloudView.center.x<-_cloudView.frame.size.width/2) {
            _cloudView.center = CGPointMake(400, 50+(arc4random()%100));
        }
    } withTime:2 withName:@"cloud"];
    
    [[GameEngine sharedManager] addAnimate:^{
        int ContentOfSetX = _birdView.contentOffset.x+36;
        ContentOfSetX=ContentOfSetX>(252/7*6)?0:ContentOfSetX;
        _birdView.contentOffset = CGPointMake(ContentOfSetX, 0);
    } withTime:1 withName:@"flyBird"];
    
    [[GameEngine sharedManager] addAnimate:^{
        _birdView.center = CGPointMake(_birdView.center.x, _birdView.center.y+_speed);
        _speed+=0.05;
    } withTime:1 withName:@"flyAnimate"];
    [[GameEngine sharedManager] setValid:NO withName:@"flyAnimate"];
    
    [[GameEngine sharedManager] addAnimate:^{
        for (int i = _wallArray.count-1; i>=0; i--) {
            UIImageView * imgv = _wallArray[i];
            imgv.center = CGPointMake(imgv.center.x-3, imgv.center.y);
            if (imgv.center.x<-40) {
                [imgv removeFromSuperview];
                [_wallArray removeObject:imgv];
            }
        }
        UIImageView * imgv = _wallArray.lastObject;
        if (_wallArray.count==0||imgv.center.x<((arc4random()%100)+100)) {
            [self addWalls];
        }
    } withTime:2 withName:@"wall"];
    [[GameEngine sharedManager] setValid:NO withName:@"wall"];
    
    [[GameEngine sharedManager] addAnimate:^{
        for (UIImageView * imgv in _wallArray) {
            if (CGRectIntersectsRect(_birdView.frame, imgv.frame)) {
                [self gameOver];
            }
        }
    } withTime:1 withName:@"gameover"];
}
-(void)gameOver
{
    [[GameEngine sharedManager] gameOver];
    _restartButton.hidden= NO;
    [self.view bringSubviewToFront:_restartButton];
}
-(void)addWalls
{
    UIImageView * topWall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top_wall"]];
    UIImageView * bottomWall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom_wall"]];
    CGFloat y = arc4random()%200;
    topWall.center = CGPointMake(450, y-200);
    bottomWall.center = CGPointMake(450, topWall.center.y+600);
    [self.view addSubview:topWall];
    [self.view addSubview:bottomWall];
    
    [_wallArray addObject:topWall];
    [_wallArray addObject:bottomWall];
}
-(void)tapAction
{
    _speed=-3;
    [[GameEngine sharedManager] setValid:YES withName:@"flyAnimate"];
    [[GameEngine sharedManager] setValid:YES withName:@"wall"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
