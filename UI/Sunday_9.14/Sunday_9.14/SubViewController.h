//
//  SubViewController.h
//  Sunday_9.14
//
//  Created by qianfeng on 14-9-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeColorProtocol <NSObject>

-(void)changecolor:(UIColor *)color;

@end


@interface SubViewController : UIViewController
@property (nonatomic,assign) id<ChangeColorProtocol>delegate;

@end
