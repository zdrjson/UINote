//
//  BSIHttpRequest.m
//  BSIHttpRequest
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "BSIHttpRequest.h"

@implementation BSIHttpRequest
- (instancetype)initWithUrl:(NSURL *)url
{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}
+(id)requestUrl:(NSURL *)url
{
    return  [[[self class] alloc] initWithUrl:url];
}
-(void)setTag:(int)tag
{
    _tag = tag;
}
-(int)tag
{
    return _tag;
}
-(void)setDelegate:(id)delegate
{
    _delegate = delegate;
}
static NSMutableArray * _allConnection = nil;
-(void)startAsync
{
    NSURLRequest * r = [NSURLRequest requestWithURL:_url];
    NSURLConnection * c =[[NSURLConnection alloc] initWithRequest:r delegate:self];
    
    
    if (!_allConnection) {
        _allConnection = [[NSMutableArray alloc] init];
        [_allConnection addObject:self];
    }
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _revcData = [[NSMutableData alloc] init];

}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_revcData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"c");

    if (_saveCb) {
        _saveCb(self);
    }
    else if ([_delegate respondsToSelector:@selector(requestFinish:)]) {
        [_delegate requestFinish:self];
    }
    [_allConnection removeObject:self];
    

}
-(NSString * )responseString
{
    return [[NSString alloc] initWithData:_revcData encoding:NSUTF8StringEncoding];
}
-(NSData *)responseData
{
    return _revcData;
}
-(void)setCompletionBlocks:(void (^)(BSIHttpRequest * r))cb
{
    NSLog(@"b");
    _saveCb = cb;
    
}

@end
