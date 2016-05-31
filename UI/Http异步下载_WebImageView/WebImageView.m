//
//  WebImageView.m
//  Http异步下载_WebImageView
//
//  Created by qianfeng on 14-9-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "WebImageView.h"

@implementation WebImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setImageUrl:(NSURL *)imageUrl
{
    self.image = nil;
    //先使用缓存数据,使用同步下载来访问缓存数据
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:imageUrl cachePolicy:NSURLRequestReturnCacheDataDontLoad timeoutInterval:0];
    
    NSURLResponse *urlSponse = nil;
    NSError * error = nil;
    NSData *data= nil;
    
    data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlSponse error:&error];
    if (error ==nil) {
        self.image = [UIImage imageWithData:data];
        return;
    }
    //缓存数据不存在，再从网络加载
    [urlRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [urlRequest setTimeoutInterval:60];
    NSURLConnection *urlConn = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:NO];
    
    if (_imageData==nil) {
        _imageData = [[NSMutableData alloc] init];
    }
    else
    {
        [_imageData setLength:0];
    }
    if (_imageLabel==nil) {
        _imageLabel= [[UILabel alloc] init];
        _imageLabel.frame = self.bounds;
        _imageLabel.textAlignment = NSTextAlignmentCenter;
        _imageLabel.font = [UIFont systemFontOfSize:30];
        [self addSubview:_imageLabel];
    }
    else
    {
        _imageLabel.text =@"努力加载中";
    }
    [urlConn start];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _imageLabel.text = @"网络不给力";
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_imageData setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_imageData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"111");
    [_imageLabel removeFromSuperview];
    self.image = [UIImage imageWithData:_imageData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
