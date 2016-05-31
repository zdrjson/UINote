//
//  V2ViewController.h
//  Thursday_10.16
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^GreenChange)(UIColor *);
@protocol redChangeProtocol <NSObject>

-(void)changeColor:(UIColor* )color;

@end
@interface V2ViewController : UIViewController
@property(nonatomic,copy) void(^greenChange)(UIColor * color);
@property (nonatomic ,assign) id<redChangeProtocol>delegate;
@end
