//
//  AppDelegate.m
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppDelegate.h"
#import "Common.h"
#define DEFINE_CONTROLLER(CName,NavInstance,tmpName)  CName * tmpName = [[CName alloc] init];\
UINavigationController * NavInstance = [[UINavigationController alloc] initWithRootViewController:tmpName];

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    DEFINE_CONTROLLER(NewsViewController, newsNavCtrl, v1);
    DEFINE_CONTROLLER(PicViewController, picNavCtrl, v2);
    DEFINE_CONTROLLER(VoteViewController, voteNavCtrl, v3);
    DEFINE_CONTROLLER(CommentViewController, commentNavCtrl, v4);
    DEFINE_CONTROLLER(TopicViewController, topicNavCtrl, v5);
    
    NSDictionary * dict1 = [NSDictionary dictionaryWithObjectsAndKeys:newsNavCtrl,kViewContrller,@"",kNormarlImage,@"",kSelcectedImage ,nil];
    NSDictionary * dict2 = [NSDictionary dictionaryWithObjectsAndKeys:picNavCtrl,kViewContrller,@"",kNormarlImage,@"",kSelcectedImage, nil];
    NSDictionary * dict3 = [NSDictionary dictionaryWithObjectsAndKeys:voteNavCtrl,kViewContrller,@"",kNormarlImage,@"",kSelcectedImage, nil];
    NSDictionary * dict4 = [NSDictionary dictionaryWithObjectsAndKeys:commentNavCtrl,kViewContrller,@"",kNormarlImage,@"",kSelcectedImage, nil];
    NSDictionary * dict5 = [NSDictionary dictionaryWithObjectsAndKeys:topicNavCtrl,kViewContrller,@"",kNormarlImage,@"",kSelcectedImage, nil];
   
    
    
    
    QFTabBarController * tabBarCtrl = [[QFTabBarController alloc] init];
    tabBarCtrl.viewControllers = [NSArray  arrayWithObjects:dict1,dict2,dict3,dict4,dict5,nil];
    
    self.window.rootViewController = tabBarCtrl;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
