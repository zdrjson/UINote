//
//  QFTabBarController.h
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFImageView.h"
#define kViewContrller @"ViewController"
#define kNormarlImage @"Normal"
#define kSelcectedImage @"Selected"

@interface QFTabBarController : UITabBarController
{
    NSMutableArray * _controllerArr;
    QFImageView * _imageView;
}
@end
