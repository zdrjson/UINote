//
//  AppDelegate.m
//  Snake
//
//  Created by qianfeng on 14-9-8.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
     int a;
    NSTimer * _timer;

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    a=0;
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
    [self createTimer];
}
-(void)createBackGround
{
    for (int i = 0; i<8; i++)
    {
        for (int j = 0; j<8; j++)
        {
            if ((i+j)%2==0)
            {
                UIView *view =[[UIView alloc]initWithFrame:CGRectMake(320, 480, 40, 40)];
           
                view.backgroundColor=[UIColor blackColor];
                [UIView beginAnimations:nil context:nil];
                 [UIView setAnimationDuration:0];
                view.frame=CGRectMake(0+40*j,20+40*i,40,40);
                [UIView commitAnimations];
                [self.window addSubview:view];
            }
            else
            {
                UIView *view =[[UIView alloc]initWithFrame:CGRectMake(320, 480, 40, 40)];
                 view.backgroundColor=[UIColor whiteColor];
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0];
                view.frame=CGRectMake(0+40*j,20+40*i,40,40);
                [UIView commitAnimations];
                [self.window addSubview:view];
            
                
            }
            if (i==0&&j==0)
            {
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDidStopSelector:@selector(showstart)];
            }
        }
    }
}
-(void)showstart
{
    UIAlertView *alerView =[[UIAlertView alloc]initWithTitle:@"提示" message:@"游戏即将开始" delegate:nil cancelButtonTitle:@"开始" otherButtonTitles:nil];
    [alerView show];
}
-(void)createSnake
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,20,40, 40)];
    view.backgroundColor=[UIColor magentaColor];
    view.tag=1001;
    [self.window addSubview:view];
    
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(40, 20, 40, 40)];
    view1.backgroundColor=[UIColor magentaColor];
    view1.tag=1002;
    [self.window addSubview:view1];
    
    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(80, 20, 40, 40)];
    view2.backgroundColor=[UIColor magentaColor];
    view2.tag=1003;
    [self.window addSubview:view2];
    
    NSArray *array =@[@"0",@"40",@"80",@"120",@"160",@"200",@"240",@"280"];
    NSArray *array1 =@[@"20",@"60",@"100",@"140",@"180",@"220",@"260",@"300"];
    int xx = arc4random()%array.count;
    int yy = arc4random()%array1.count;
    if ((xx!=view.frame.origin.x||xx!=view1.frame.origin.x||xx!=view2.frame.origin.x)&&(yy!=view.frame.origin.y||yy!=view1.frame.origin.y||yy!=view2.frame.origin.y))
    {
        UIView *viewfood=[[UIView alloc]initWithFrame:CGRectMake([array[xx] intValue],[array1[yy] intValue], 40, 40)];
        viewfood.backgroundColor=[UIColor blueColor];
        [self.window addSubview:viewfood];
    }
    
   
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
        [btn addTarget:self action:@selector(moveView:) forControlEvents:UIControlEventTouchUpInside];
        [self.window addSubview:btn];
    }
}
-(void)moveView:(id)obj
{
    
    UIButton * btn =(UIButton *)obj;
    if (btn.tag==101)
    {
        a=1;
        UIButton *btndown =(UIButton *)[self.window viewWithTag:102];
        btndown.userInteractionEnabled= NO;
        
        UIButton *btnright =(UIButton *)[self.window viewWithTag:104];
        btnright .userInteractionEnabled= YES;
        
        UIButton *btnleft =(UIButton *)[self.window viewWithTag:103];
        btnleft.userInteractionEnabled= YES;
    }
    else if(btn.tag==102)
    {
        a=2;
        UIButton *btnup =(UIButton *)[self.window viewWithTag:101];
        btnup.userInteractionEnabled= NO;
        
        UIButton *btnright =(UIButton *)[self.window viewWithTag:104];
        btnright .userInteractionEnabled= YES;
        
        UIButton *btnleft =(UIButton *)[self.window viewWithTag:103];
        btnleft .userInteractionEnabled= YES;
    }
    else if(btn.tag==103)
    {
        a=3;
        UIButton *btnright =(UIButton *)[self.window viewWithTag:104];
        btnright .userInteractionEnabled= NO;

        UIButton *btndown =(UIButton *)[self.window viewWithTag:102];
        btndown.userInteractionEnabled= YES;
        
        UIButton *btnup =(UIButton *)[self.window viewWithTag:101];
        btnup.userInteractionEnabled= YES;

    }
    else if(btn.tag==104)
    {
        a=4;
        UIButton *btnleft =(UIButton *)[self.window viewWithTag:103];
        btnleft .userInteractionEnabled= NO;
        
        UIButton *btndown =(UIButton *)[self.window viewWithTag:102];
        btndown.userInteractionEnabled= YES;
        
        UIButton *btnup =(UIButton *)[self.window viewWithTag:101];
        btnup.userInteractionEnabled= YES;

    }
    else if(btn.tag==105)
    {
        if ([btn.titleLabel.text isEqualToString:@"暂停"])
        {
            [_timer setFireDate:[NSDate distantFuture]];
            [btn setTitle:@"开始" forState:UIControlStateNormal];
            for (int i =0; i<4; i++)
            {
                UIButton *btn =(UIButton *)[self.window viewWithTag:101+i];
                btn.userInteractionEnabled=NO;
            }
        }
        else
        {
            [_timer setFireDate:[NSDate distantPast]];
            [btn setTitle:@"暂停" forState:UIControlStateNormal];
            for (int i =0; i<4; i++)
            {
                UIButton *btn =(UIButton *)[self.window viewWithTag:101+i];
                btn.userInteractionEnabled=YES;
            }
        }
    
    }
}

-(void)createTimer
{
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    

}
-(void)updateTimer
{
    
    UIView * view =[self.window viewWithTag:1001];
    UIView * view1 =[self.window viewWithTag:1002];
    UIView * view2 =[self.window viewWithTag:1003];
    float x = view2.frame.origin.x;
    float y = view2.frame.origin.y;
    float width = view2.frame.size.width;
    float height = view2.frame.size.height;
    
    if (a==1)
    {
        if (y==20)
        {
             NSLog(@"上");
            a=0;
            [self showover];
            [_timer setFireDate:[NSDate distantFuture]];
            
        }
        else
        {
            CGRect rect =CGRectMake(x, y-40,width, height);
            view.frame=view1.frame;
            view1.frame = view2.frame;
            view2.frame=rect;
        }
    }
    else if (a==2)
    {
        if (y==300)
        {
             NSLog(@"下");
             a=0;
            [self showover];
            [_timer setFireDate:[NSDate distantFuture]];
            
        }
        else
        {
            CGRect rect =CGRectMake(x, y+40,width, height);
            view.frame=view1.frame;
            view1.frame = view2.frame;
            view2.frame=rect;
        }
    }
    else if (a==3)
    {
        if (x==0)
        {

             NSLog(@"左");
             a=0;
             [self showover];
             [_timer setFireDate:[NSDate distantFuture]];
        }
        else
        {
            CGRect rect =CGRectMake(x-40, y,width, height);
            view.frame=view1.frame;
            view1.frame = view2.frame;
            view2.frame=rect;
          
        }
       
    }
    else if (a==4)
    {
        if (x==280)
        {
            NSLog(@"右");
            a=0;
            [self showover];
            [_timer setFireDate:[NSDate distantFuture]];
        }
        else
        {
            CGRect rect =CGRectMake(x+40, y,width, height);
            view.frame=view1.frame;
            view1.frame = view2.frame;
            view2.frame=rect;
        }
    }
    
   
    
    
    
}
-(void)showover
{
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"游戏结束" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重新开始", nil];
    [alerView show];
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        [self createGameObj];
        [_timer setFireDate:[NSDate distantPast]];
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
