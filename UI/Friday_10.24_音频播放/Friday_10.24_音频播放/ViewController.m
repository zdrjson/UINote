//
//  ViewController.m
//  Friday_10.24_音频播放
//
//  Created by qianfeng on 14-10-24.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    AVAudioPlayer * _player;
    NSTimer * _timer;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"播放" style:UIBarButtonItemStylePlain target:self action:@selector(playAction)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"暂停" style:UIBarButtonItemStylePlain target:self action:@selector(pauseAction)];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"song1" ofType:@"mp3"];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    
    _player.delegate = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
}
-(void)playAction
{
    _player.currentTime = 100;
    _player.numberOfLoops = 0;
    [_player prepareToPlay];
//    if (!_player) {
        [_player play];
//    }
}
-(void)pauseAction
{
    [_player pause];
}
-(void)timerAction
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
