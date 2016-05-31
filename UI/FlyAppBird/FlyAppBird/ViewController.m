//
//  ViewController.m
//  FlyAppBird
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
    [self uiConfig];//在一个项目不要出现多个计数器
    [self animateConfig];
}
//给所有的控件做初始化
-(void)uiConfig
{
    _wallArray = [[NSMutableArray alloc] init];
    _restartButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [_restartButton setTitle:@"重新开始" forState:UIControlStateNormal];
    _restartButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9];
    _restartButton.frame = CGRectMake(0, 220, 320, 60);
    [self.view addSubview:_restartButton];
    _restartButton.hidden = YES;
    [_restartButton addTarget:self action:@selector(restartAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    
    _cloudView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 100, 128, 71)];
    [self.view addSubview:_cloudView];
    UIImage * cloudImg = [UIImage imageNamed:@"cloud"];
    _cloudView.image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(cloudImg.CGImage, CGRectMake(0, 0, 128 *2, 71 *2))];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.51f green:0.67f blue:0.95f alpha:1.00f];
    
    _planeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plane1"]];//想保持原图大小用initwithimage
    _planeView.center = CGPointMake(400, 100);
    [self.view addSubview:_planeView];
    
    _birdView = [[UIScrollView alloc] initWithFrame:CGRectMake(80, 150, 36, 24)];
    _birdView.backgroundColor = [UIColor redColor];
    UIImageView * imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flappy_fly"]];
    [_birdView addSubview:imgv];
    [self.view addSubview:_birdView];

}
-(void)restartAction
{
    [[GameEngine sharedEngine] restart];
    _restartButton.hidden = YES;
    _birdView.center = CGPointMake(80, 150);
    for (UIImageView * imgv in _wallArray) {
        [imgv removeFromSuperview];
    }
    [_wallArray removeAllObjects];
    [[GameEngine sharedEngine] setValid:NO withName:@"flyAnimate"];
    [[GameEngine sharedEngine] setValid:NO withName:@"wall"];
    
}
//给控件添加动画
-(void)animateConfig
{
    //飞机
    [[GameEngine sharedEngine] addAnimate:^{
        _planeView.center = CGPointMake(_planeView.center.x-3, _planeView.center.y);//动画
        if (_planeView.center.x<-_planeView.frame.size.width/2) {
            UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"plane%d",6]];
            _planeView.image = img;
            _planeView.frame = CGRectMake(350, (50+arc4random()%100), img.size.width, img.size.height);
//             NSLog(@"%@",NSStringFromCGRect(_planeView.frame));
        }
    } withTime:2 withName:@"plane"];
    //云
    [[GameEngine sharedEngine] addAnimate:^{
        _cloudView.center = CGPointMake(_cloudView.center.x-2, _cloudView.center.y);
    } withTime:2 withName:@"cloud"];
    //鸟自身飞
    [[GameEngine sharedEngine] addAnimate:^{
        int contentOfSetX = _birdView.contentOffset.x+36;
        contentOfSetX = contentOfSetX>230?0:contentOfSetX;
        _birdView.contentOffset = CGPointMake(contentOfSetX, 0);
    } withTime:2 withName:@"fly"];
    //鸟上下飞
    [[GameEngine sharedEngine] addAnimate:^{
        _birdView.center = CGPointMake(_birdView.center.x, _birdView.center.y+_speed);
        _speed+= 0.05;
    } withTime:1 withName:@"flyAnimate"];
    //鸟开始不上下飞
    [[GameEngine sharedEngine] setValid:NO withName:@"flyAnimate"];
    //柱子
    [[GameEngine sharedEngine] addAnimate:^{
        for (int i = _wallArray.count-1; i>=0; i--) {//移动数组视图的位置从后往前面遍历，和爱限免中collectionVc中移动button差不多
            UIImageView * imgv = _wallArray[i];
            imgv.center = CGPointMake(imgv.center.x-3, imgv.center.y);
            if (imgv.center.x<-40) {
                [imgv removeFromSuperview];
                [_wallArray removeObject:imgv];
            }
        }
        UIImageView * imgv = _wallArray.lastObject;
        if (_wallArray .count==0||imgv.center.x<(arc4random()%100+100)) {
            [self addWalls];
        }
    } withTime:2 withName:@"wall"];
    //柱子开始不出现
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
//    [[GameEngine sharedEngine] setValid:NO withName:@"fly"];
//    [[GameEngine sharedEngine] setValid:NO withName:@"flyAnimate"];
    [[GameEngine sharedEngine] gameOver];
    _restartButton.hidden = NO;
    [self.view bringSubviewToFront:_restartButton];
}
-(void)addWalls
{
    UIImageView * topWall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top_wall"]];
    UIImageView * bottomWall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom_wall"]];
    CGFloat y = arc4random()%200;
    topWall.center = CGPointMake(450, y-200);//topWall.center.y==-250时正好topwall的底部与屏幕顶部相交
    bottomWall.center = CGPointMake(450, topWall.center.y+600);
    
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
