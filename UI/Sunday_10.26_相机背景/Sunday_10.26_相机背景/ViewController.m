//
//  ViewController.m
//  Sunday_10.26_相机背景
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
{
    AVCaptureSession * _session;//会话是硬件和程序之间的会话
    
    AVCaptureVideoPreviewLayer * _layer;//层（媒体浏览层）展示
    
    AVCaptureStillImageOutput * _output; //输出
    
    BOOL _isOpenCamrea;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tap.numberOfTapsRequired = 3;
    [self.view addGestureRecognizer:tap];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"拍照" style:UIBarButtonItemStylePlain target:self action:@selector(clickAction)];
    
    //配置摄像头
    [self configCamera];
}
-(void)configCamera
{
    _session = [[AVCaptureSession alloc] init];
    //设置像素
    _session.sessionPreset = AVCaptureSessionPreset1280x720;
    
    _layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    
    _layer.frame = self.view.bounds;
    [self.view.layer addSublayer:_layer];
    //得到一个硬件
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建一个输入
    AVCaptureInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    //给会话添加输入
    [_session addInput:input];
    
    //初始化输出
    _output = [[AVCaptureStillImageOutput alloc] init];
    [_output setOutputSettings:@{AVVideoCodecKey: AVVideoCodecJPEG}];
    //给会话添加输出
    [_session addOutput:_output];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
    label.text = @"";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    
}
-(void)clickAction
{
    AVCaptureConnection * conn = _output.connections[0];
    [_output captureStillImageAsynchronouslyFromConnection:conn completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        NSData * data = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage * img = [UIImage imageWithData:data];
        UIImageView * imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 150)];
        imgv.image = img;
        [self.view addSubview:imgv];
    }];
}
-(void)tapAction
{
    if (_isOpenCamrea) {
        
        [self closeCamrea];
    }
    else
    {
        [self openCamrea];
    }
    _isOpenCamrea = !_isOpenCamrea;
}
-(void)openCamrea
{
    NSLog(@"打开");
    [_session startRunning];
    if (_layer) {
        [self.view.layer addSublayer:_layer];
    }
}
-(void)closeCamrea
{
    NSLog(@"关闭");
    [_session stopRunning];
    [_layer removeFromSuperlayer];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
