//
//  AppDelegate.m
//  HelloWorld
//
//  Created by qianfeng on 14-9-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
//这个方法是应用程序加载时调用的方法。
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
  //  NSLog(@"%s", __FUNCTION__);//__FUNCTION__ 前后都是两个下划线
    
    //设置应用程序的窗口 initWithFrame:初始化方法，用来初始化窗口的大小。
    //UIWindow 是应用程序窗口类，我们一般不使用这个类。
    //UIScreen 指定的是硬件屏幕，mainScreen取到当前应用程序的主屏幕。
    //bounds 能取到当前屏幕的大小。
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    //设置窗口的背景颜色
    self.window.backgroundColor = [UIColor redColor];
    
    //使窗口可见。
    [self.window makeKeyAndVisible];
    return YES;
}

//应用程序将要进入非活动状态调用的方法
- (void)applicationWillResignActive:(UIApplication *)application//从活动状态进入后台模式，首先调用这个方法
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //何时调用？
    //当我们的应用程序即将从活跃状态进入点到非活跃状态，这个消息会被发送。这种情况会在某些临时中断的情况下发生（比如，收到电话或者短消息），或者用户退出应用程序，应用程序开始转换成后台状态是也会调用
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    //调用该方法时，我们该做的处理：
    //使用这个方法来暂停正在执行的任务，使定时器不可用，和减缓OpenGL ES 帧率。游可以使用这个方法来暂停游戏。
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
//应用程序已经进入后台模式时调用的方法
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //使用这个方法来释放共享的资源，保存用户数据，禁用定时器，并且在应用程序终止之前保存足够的应用程序信息来恢复你的应用程序的当前状态。
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    
    //如果你的应用程序支持后台运行模式，这个方法会被调用而不是applicationWillTerminate方法被调用，当用户退出应用程序时。
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
//应用程序即将进入前台模式
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //这个方法会在应用程序从后台模式切换到非活跃状态时调用，在这里你可以撤销应用程序在进入后台所做的许多事情。
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//应用程序已经变成活跃时调用
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //重启我们暂停的任务（或者还没有开始的任务）,在我们应用程序在非活跃状态时，如果应用程序之前处于后台模式，我们可以选择刷新UI
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application//Application does not run in background为YES时调用
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //这个方法被调用当应用程序被终止的时候，保存适当的数据
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//收到内存警告调用的方法。（在这里我们可以在当前应用程序中删除那些不需要的数据）//已经加载好的数据
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    NSLog(@"收到内存警告");    
}

@end
