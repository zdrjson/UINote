//
//  StatusBarConfig.m
//  Sunday_10.19_StatusBarConfig
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "StatusBarConfig.h"

@interface StatusBarConfig ()
+(id)sharedStatus;
@end

@implementation StatusBarConfig
{
    UIWindow * _w;
}
+(id)sharedStatus
{
    static StatusBarConfig * _s = nil;
    if (!_s) {
        _s = [[StatusBarConfig alloc] init];
    }
    return _s;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
         _w = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    }
    return self;
}
-(void)showMsg:(NSString *)str withTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)backgroundColor
{
    _w.alpha = 1;
    UILabel * label = [[UILabel alloc] initWithFrame:_w.bounds];
    [_w addSubview:label];
    label.text = str;
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = textColor;
    label.backgroundColor = [UIColor cyanColor];
    [_w makeKeyAndVisible];
    _w.windowLevel = UIWindowLevelStatusBar +1;
    [self performSelector:@selector(hideAction) withObject:nil afterDelay:2.0];
}
-(void)hideAction
{
    [UIView animateWithDuration:1 animations:^{
        _w.alpha = 0;
    } completion:^(BOOL finished) {
//        _w = nil;
    }];
}
+(void)showMsg:(NSString *)str
{
    [self showMsg:str withTextColor:[UIColor blackColor]];
}
+(void)showMsg:(NSString *)str withTextColor:(UIColor *)textColor
{
    [[self sharedStatus] showMsg:str withTextColor:textColor withBackgroundColor:[UIColor cyanColor]];
}
+(void)showMsg:(NSString *)str withTextColor:(UIColor *)textColor withBackgroundColor:(UIColor *)backgroundColor
{
    [[self sharedStatus] showMsg:str withTextColor:textColor withBackgroundColor:backgroundColor];
}
@end
