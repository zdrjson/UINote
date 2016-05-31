//
//  QFURLConnection.h
//  HttpDemo
//
//  Created by qianfeng on 14-10-11.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFURLConnection : NSObject
{
    NSURL * _url;
    NSThread * _thread;
}
@property (nonatomic,retain)NSURL * url;
-(id)initWithUrl:(NSURL *)url delegate:(id)delegate;

@end
