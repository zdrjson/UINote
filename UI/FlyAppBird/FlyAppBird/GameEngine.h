//
//  GameEngine.h
//  FlyAppBird
//
//  Created by qianfeng on 14-10-27.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimateElement : NSObject
@property (nonatomic,copy) void(^animate)();
@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign) NSInteger time;
@property (nonatomic,assign) BOOL valid;
@end

@interface GameEngine : NSObject//单例管理很多动画//和HttpRequestManager cell和model是一一对应
+(id)sharedEngine;//管理类，工具类 用单例
-(void)addAnimate:(void(^)())animate withTime:(NSInteger)time withName:(NSString *)name;
//设置动画是否有效
-(void)setValid:(BOOL)valid withName:(NSString *)name;

-(void)gameOver;

-(void)restart;

@end
