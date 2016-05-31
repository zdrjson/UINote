//
//  ViewController.m
//  Friday_10.24_视频播放
//
//  Created by qianfeng on 14-10-24.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController ()
{
    //系统自带的
    MPMoviePlayerViewController * _player;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"播放" style:UIBarButtonItemStylePlain target:self action:@selector(playAction)];
    
}
-(void)playAction
{
    if (!_player) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp4"];
        _player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    }
//    [self presentViewController:_player animated:YES completion:^{
//       //弹出界面后，操作:将其他的音频停止
//    }];
    _player.moviePlayer.shouldAutoplay = YES;
    _player.moviePlayer.backgroundView.backgroundColor = [UIColor cyanColor];
    [self presentMoviePlayerViewControllerAnimated:_player];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
