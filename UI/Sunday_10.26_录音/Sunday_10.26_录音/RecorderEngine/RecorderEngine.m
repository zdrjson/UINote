//
//  RecorderEngine.m
//  录音
//
//  Created by huangdl on 14-8-24.
//  Copyright (c) 2014年 huangdl. All rights reserved.
//

#import "RecorderEngine.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
@implementation RecorderEngine
{
    AVAudioRecorder *_recorder;
    AVAudioPlayer *_player;
    NSString *_filaPath;
    NSDictionary *recorderSettingsDict;
    NSTimer *_timer;
    double lowPassResults;
}
+(id)sharedEngine
{
    static RecorderEngine *_e = nil;
    if (!_e) {
        _e = [[RecorderEngine alloc]init];
    }
    return _e;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (!_recorderFileName || _recorderFileName.length == 0) {
            NSString *str = [NSString stringWithFormat:@"%@",[NSDate date]];
            _recorderFileName = [str stringFromMD5];
        }
        if ([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0) {
            AVAudioSession *session = [AVAudioSession sharedInstance];
            [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
            if (session) {
                [session setActive:YES error:nil];
            }
        }
        _filaPath = [[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent: _recorderFileName]stringByAppendingString:@".aac"];
        NSLog(@"%@",_filaPath);
        recorderSettingsDict =[[NSDictionary alloc] initWithObjectsAndKeys:
                               [NSNumber numberWithInt:kAudioFormatMPEG4AAC],AVFormatIDKey,
                               [NSNumber numberWithInt:1000.0],AVSampleRateKey,
                               [NSNumber numberWithInt:2],AVNumberOfChannelsKey,
                               [NSNumber numberWithInt:8],AVLinearPCMBitDepthKey,
                               [NSNumber numberWithBool:NO],AVLinearPCMIsBigEndianKey,
                               [NSNumber numberWithBool:NO],AVLinearPCMIsFloatKey,
                               nil];
        
        
        
    }
    return self;
}


-(void)configFilePath
{
    
}

-(void)startRecorder
{
    _recorder = [[AVAudioRecorder alloc]initWithURL:[NSURL fileURLWithPath:_filaPath] settings:recorderSettingsDict error:nil];
    if (_recorder) {
        _recorder.meteringEnabled = YES;
        [_recorder prepareToRecord];
        [_recorder record];
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:_refrechTime target:self selector:@selector(refreshAction) userInfo:nil repeats:YES];
    }
    else
    {
        NSLog(@"录音失败");
    }
}

-(void)refreshAction
{
    [_recorder updateMeters];
    const double ALPHA = 0.05;
    double peakPowerForChannel = pow(10, (0.05 * [_recorder peakPowerForChannel:0]));
    lowPassResults = ALPHA * peakPowerForChannel + (1.0 - ALPHA) * lowPassResults;
    
    NSLog(@"Average input: %f Peak input: %f Low pass results: %f", [_recorder averagePowerForChannel:0], [_recorder peakPowerForChannel:0], lowPassResults);
    
    if ([_delegate respondsToSelector:@selector(recorderRefresh:peak:)]) {
        [_delegate recorderRefresh:self peak:[_recorder averagePowerForChannel:0]];
    }
}

-(void)stopRecorder
{
    [_recorder stop];
    [_timer invalidate];
    _timer = nil;
    if ([_delegate respondsToSelector:@selector(recorderStop)]) {
        [_delegate recorderStop];
    }
}

-(void)playRecorder
{
    _player = nil;
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:_filaPath] error:nil];
    if (_player) {
        [_player play];
    }
}




@end






#if __has_feature(objc_arc)
#define SAFE_AUTORELEASE(a) (a)
#else
#define SAFE_AUTORELEASE(a) [(a) autorelease]
#endif
@implementation NSString(MD5Addition)

- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return SAFE_AUTORELEASE(outputString);
}

@end


















