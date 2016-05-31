//
//  WebImageView.h
//  Friday4_9.19
//
//  Created by qianfeng on 14-9-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebImageView : UIImageView <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSURL * _imageUrl;
    
    UILabel * _imageLabel;
    
    NSMutableData * _imageData;
    
}
-(void)setImageUrl:(NSURL *)imageUrl;

@end
