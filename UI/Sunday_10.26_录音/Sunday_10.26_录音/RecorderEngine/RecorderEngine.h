//
//  RecorderEngine.h
//  录音
//
//  Created by huangdl on 14-8-24.
//  Copyright (c) 2014年 huangdl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecorderEngine;

@protocol RecorderDelegate <NSObject>

-(void)recorderRefresh:(RecorderEngine *)engine peak:(double)peak;
-(void)recorderStop;

@end

@interface RecorderEngine : NSObject

@property (nonatomic,assign) double refrechTime;
@property (nonatomic,copy) NSString *recorderFileName;

@property (nonatomic,weak) id<RecorderDelegate> delegate;

+(id)sharedEngine;

-(void)startRecorder;

-(void)stopRecorder;

-(void)playRecorder;



@end



@interface NSString(MD5Addition)

- (NSString *) stringFromMD5;

@end
