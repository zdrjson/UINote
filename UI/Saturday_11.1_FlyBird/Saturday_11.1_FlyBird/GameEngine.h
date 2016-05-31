//
//  GameEngine.h
//  Saturday_11.1_FlyBird
//
//  Created by qianfeng on 14-11-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimateElement : NSObject
@property (nonatomic,copy) void(^animate)();
@property (nonatomic,assign) NSInteger time;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign) BOOL valid;

@end

@interface GameEngine : NSObject
+(id)sharedEngine;
-(void)addAnimate:(void(^)())animate withTime:(NSInteger)time withName:(NSString *)name;
-(void)setValid:(BOOL)valid withName:(NSString *)name;
-(void)gameOver;
-(void)restart;
@end
