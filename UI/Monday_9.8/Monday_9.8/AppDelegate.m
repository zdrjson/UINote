//
//  AppDelegate.m
//  Monday_9.8
//
//  Created by qianfeng on 14-9-8.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@implementation AppDelegate
//{
//    NSTimer  * _timer;
//
//}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//    RootViewController * rvc = [[RootViewController alloc]init];
//    self.window.rootViewController = rvc;
   // [self createBtn];
    [self createGameObj];
    
    
    self.window.backgroundColor = [UIColor cyanColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)createGameObj
{
    [self createBackGround];
    [self createSnake];
    [self createButtons];

}
-(void)createBackGround
{
    for (int i = 0; i<8; i++)
    {
        for (int j = 0; j<8; j++)
        {
            if ((i+j)%2==0)
            {
                UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0+40*j,20+40*i,40,40)];
                view.backgroundColor=[UIColor blackColor];
                [self.window addSubview:view];
            }
            else
            {
                UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0+40*j, 20+40*i, 40, 40)];
                view.backgroundColor=[UIColor whiteColor];
                [self.window addSubview:view];
            
            }
        }
    }
}
-(void)createSnake
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(40, 20,40, 40)];
    view.backgroundColor=[UIColor magentaColor];
    view.tag=1001;
    [self.window addSubview:view];
    
//    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(40, 20, 40, 40)];
//    view1.backgroundColor=[UIColor magentaColor];
//    view.tag=102;
//    [self.window addSubview:view1];
}
-(void)createButtons
{
    NSArray *array =@[@"上",@"下",@"左",@"右",@"暂停"];
    for (int i=0 ; i<array.count; i++)
    {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
        btn.backgroundColor=[UIColor redColor];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.frame=CGRectMake(0+50*i, 400, 40, 40);
        btn.tag=101+i;
        [btn addTarget:self action:@selector(moveView:) forControlEvents:UIControlEventTouchDragInside];
        [self.window addSubview:btn];
        
    }
}
-(void)moveView:(id)obj
{
    
    UIButton * btn =(UIButton *)obj;
    UIView * view =[self.window viewWithTag:1001];
    float x = view.frame.origin.x;
    float y = view.frame.origin.y;
    float width =view.frame.size.width;
    float height = view.frame.size.height;
    NSLog(@"%d",btn.tag);
    if (btn.tag==101)
    {
        CGRect rect = CGRectMake(x, y-40, width, height);
        view.frame=rect;
    }
    else if (btn.tag==102)
    {
        CGRect rect = CGRectMake(x, y+40, width, height);
        view.frame=rect;

    }
    else if (btn.tag==103)
    {
        CGRect rect = CGRectMake(x-40, y, width, height);
        view.frame=rect;

    }
    else if (btn.tag==104)
    {
        CGRect rect = CGRectMake(x+40, y, width, height);
        view.frame=rect;
    }
    
}
#if 0
-(void)createBtn
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(10, 400, 50, 50);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"停止" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchDown];
    btn.tag=101;
    [self.window addSubview:btn];

}
-(void)createTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];

}

-(void)pressBtn:(id)obj
{
    UIButton *btn =(UIButton *)obj;
    
    if ([btn.titleLabel.text isEqualToString:@"停止"])
    {
        [_timer setFireDate:[NSDate distantFuture]];
        [btn setTitle:@"开始" forState:UIControlStateNormal];
    }
    else
    {
        [_timer setFireDate:[NSDate distantPast]];
        [btn setTitle:@"停止" forState:UIControlStateNormal];
    }
    
}
#endif
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
