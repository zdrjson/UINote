//
//  WebImageView.h
//  Http异步下载_WebImageView
//
//  Created by qianfeng on 14-9-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebImageView : UIImageView <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    //下载资源的url
    NSURL * _imageUrl;
    //显示网络不给力，或者努力加载中
    UILabel * _imageLabel;
    //保存下载到图片数据
    NSMutableData * _imageData;
}
//设置当前需要下载的图片资源的url
-(void)setImageUrl:(NSURL *)imageUrl;

@end
