//
//  RootViewController.h
//  Friday3_9.19
//
//  Created by qianfeng on 14-9-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData * _data;
    
    UIImageView * _imageView;

}

@end
