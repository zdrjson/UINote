//
//  GameEngine.m
//  Saturday_11.1_FlyBird
//
//  Created by qianfeng on 14-11-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "GameEngine.h"

@implementation AnimateElement



@end

@implementation GameEngine
{
    NSTimer * _timer;
    NSMutableArray * _animateArray;
}
+(id)sharedEngine
{
    static GameEngine * _e = nil;
    if (!_e) {
        _e = [[GameEngine alloc] init];
    }
    return _e;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        _animateArray = [NSMutableArray array];
    }
    return self;
}
static int n = 0;
-(void)timerAction
{
    n++;
    for (AnimateElement * ani in _animateArray) {
        if (ani.valid && n%ani.time==0) {
            ani.animate();
        }
    }
}
-(void)addAnimate:(void (^)())animate withTime:(NSInteger)time withName:(NSString *)name
{
    AnimateElement * ani = [[AnimateElement alloc] init];
    ani.animate = animate;
    ani.time = time;
    ani.name = name;
    ani.valid = YES;
    [_animateArray addObject:ani];
}
-(void)setValid:(BOOL)valid withName:(NSString *)name
{
    for (AnimateElement * ani in _animateArray) {
        if ([ani.name isEqualToString:name]) {
            ani.valid = valid;
        }
    }
}
-(void)gameOver
{
    [_timer setFireDate:[NSDate distantFuture]];
}
-(void)restart
{
    n=0;
    [_timer setFireDate:[NSDate date]];
}
@end
