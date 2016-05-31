//
//  ViewController.m
//  Sunday_10.26_录音
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    RecorderEngine * _engine;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(startAction)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"结束" style:UIBarButtonItemStylePlain target:self action:@selector(stopAction)];
    _engine = [RecorderEngine sharedEngine];
    _engine.refrechTime = 0.1;
    _engine.delegate =  self;
}
-(void)startAction
{
    [_engine startRecorder];
}
-(void)stopAction
{
    [_engine stopRecorder];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_engine playRecorder];
}

-(void)recorderRefresh:(RecorderEngine *)engine peak:(double)peak
{

}
-(void)recorderStop
{
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
