//
//  RootViewController.h
//  Http_异步下载
//
//  Created by qianfeng on 14-9-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    //存储服务端返回的数据
    NSMutableData *_data;
    //用来显示网络上下载的图片
    UIImageView * _imageView;
}
@end
