//
//  AppDelegate.m
//  Sunday2_9.21
//
//  Created by qianfeng on 14-9-21.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self createTabBarController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)createTabBarController
{
    FirstViewController * firstVC =[[FirstViewController alloc] init];
    firstVC.tabBarItem.tag = 101;
    UINavigationController *firstNavCtrl = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstVC.title = @"界面首页";
    firstNavCtrl.title = @"界面一";
    firstNavCtrl.tabBarItem.title = @"首页";
    firstNavCtrl.tabBarItem.image = [UIImage imageNamed:@"tab_0"];
    firstNavCtrl.tabBarItem.tag = 101;
    SecondViewController * secondVC = [[SecondViewController alloc] init];
    secondVC.tabBarItem.tag= 102;
    UINavigationController * secondNavCtrl = [[UINavigationController alloc] initWithRootViewController:secondVC];
    secondNavCtrl.title = @"界面二";
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"页面二" image:[UIImage imageNamed:@"tab_1"] tag:102];
    secondNavCtrl.tabBarItem = tabBarItem;

    ThirdViewController * thirdVC = [[ThirdViewController alloc] init];
    thirdVC.title = @"界面三";
    UITabBarItem * sysTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:103];
    thirdVC.tabBarItem = sysTabBarItem;
    
    FourthViewController * fourthVC = [[FourthViewController alloc] init];
    fourthVC.title= @"界面四";
    UIImage * image = [UIImage imageNamed:@"tab_c2"];
    UIImage * image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"页面4" image:[UIImage imageNamed:@"tab_2"] selectedImage:image1];
    tabBarItem4.title =@"界面4";
    fourthVC.tabBarItem = tabBarItem4;
    fourthVC.tabBarItem.tag = 104;
    FifthViewController * fifthVC = [[FifthViewController alloc] init];
    fifthVC.title =@"界面5";
    fifthVC.tabBarItem.tag = 105;
    SixthViewController * sixthVC = [[SixthViewController alloc] init];
    sixthVC.title = @"界面6";
    sixthVC.tabBarItem.tag = 106;
    SeventhViewController * seventhVC = [[SeventhViewController alloc] init];
    seventhVC.title = @"界面7";
    seventhVC.tabBarItem.tag = 107;
    NSArray * controllers = @[firstVC,secondVC,thirdVC,fourthVC,fifthVC,sixthVC,seventhVC];
    UITabBarController  * tabBarCtrl = [[UITabBarController alloc] init];
   
    
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    NSArray * array = [def objectForKey:@"KEY_ARRAY"];
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
//    NSArray *  array1 = [[NSArray alloc] init];
    if (array!=nil) {
                for (NSNumber *number in array) {
            for (UIViewController * obj in controllers) {
                if ([number integerValue]==obj.tabBarItem.tag) {
                    [mutArray addObject:obj];
//                   NSLog(@"%@", [array1 arrayByAddingObject:obj]);
                }
            }
        }
        controllers = mutArray;
    }
    
    tabBarCtrl.viewControllers = controllers;
    self.window.rootViewController = tabBarCtrl;
    tabBarCtrl.tabBar.translucent = YES;
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 380, 100, 100)];
//    view.backgroundColor = [UIColor blackColor];
//    [firstNavCtrl.view addSubview:view];
    
    tabBarCtrl.tabBar.tintColor = [UIColor yellowColor];
    tabBarCtrl.tabBar.barTintColor = [UIColor cyanColor];
    tabBarCtrl.tabBar.selectedImageTintColor = [UIColor magentaColor];
    
    tabBarCtrl.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"tabBarIndicator.png"];
    tabBarCtrl.delegate =self;
    
 

}
#pragma mark -UITabBarController协议方法
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    NSLog(@"%@",viewController);
}
-(void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers
{
    NSLog(@"willBeginCustomizingViewControllers");
}
-(void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    NSLog(@"didEndCustomizingViewControllers");
    if (changed==YES) {
        NSMutableArray * array = [[NSMutableArray alloc] init];
        for (UIViewController * obj in viewControllers) {
            [array addObject:[NSNumber numberWithInteger:obj.tabBarItem.tag]];
            
        }
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:array forKey:@"KEY_ARRAY"];
        [def synchronize];
        NSLog(@"dsd");
    }
    
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
