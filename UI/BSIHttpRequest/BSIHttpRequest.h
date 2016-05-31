//
//  BSIHttpRequest.h
//  BSIHttpRequest
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BSIHttpRequestDelegate;

@interface BSIHttpRequest : NSObject <NSURLConnectionDataDelegate>
{
    NSURL * _url;
    int _tag;
    id <BSIHttpRequestDelegate>_delegate;
    NSMutableData * _revcData;
    void (^_saveCb)(BSIHttpRequest * r);
}
@property (nonatomic,retain) NSURL * url;
-(id)initWithUrl:(NSURL *)url;
+(id)requestUrl:(NSURL *)url;
-(void)setTag:(int)tag;
-(int)tag;
-(void)setDelegate:(id<BSIHttpRequestDelegate>)delegate;
-(void)startAsync;
-(NSString * )responseString;
-(NSData *)responseData;
-(void)setCompletionBlocks:(void (^)(BSIHttpRequest * r))cb;
@end
@protocol BSIHttpRequestDelegate <NSObject>

-(void)requestFinish:(BSIHttpRequest *)r;

@end