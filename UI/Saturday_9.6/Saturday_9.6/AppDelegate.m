//
//  AppDelegate.m
//  Saturday_9.6
//
//  Created by qianfeng on 14-9-6.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    NSTimer * _timer ;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
#if 0
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(100,100,150,30)];
    label.text=@"Name:www.baidu.com";
    label.textColor =[UIColor magentaColor];
    label.backgroundColor = [UIColor cyanColor];
    label.font = [UIFont boldSystemFontOfSize:50];
    label.textAlignment=NSTextAlignmentCenter;
    label.highlighted=YES;
    label.highlightedTextColor=[UIColor darkGrayColor];
    //label.shadowColor =[UIColor brownColor];
    //label.shadowOffset=CGSizeMake(10, 10);
    label.adjustsFontSizeToFitWidth =YES;
    label.font=[UIFont fontWithName:[[UIFont familyNames] objectAtIndex:2] size:30];
   // NSLog(@"%@",[[UIFont familyNames] objectAtIndex:2]);[UIFont familyNames] //为字体的名字
    label.baselineAdjustment=UIBaselineAdjustmentAlignBaselines;

    
    [self.window  addSubview:label];
 #endif
    
#if 0
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn setTitle:@"开启" forState:UIControlStateHighlighted];
    btn.frame=CGRectMake(20, 50, 100, 200);
    btn.backgroundColor=[UIColor magentaColor];
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchDown];
    [btn setBackgroundImage:[UIImage imageNamed:@"2012061312555539"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"2012061312555539"] forState:UIControlStateNormal];
    [self.window addSubview:btn];
    
#endif
#if 0
    UIView *redView =[[UIView alloc]initWithFrame:CGRectMake(20, 50, 100, 200)];
    redView.backgroundColor =[UIColor redColor];
    [self.window addSubview:redView];
    
    UIView *yellowView = [[UIView alloc]initWithFrame: CGRectMake(20, 300, 100, 100)];
    yellowView.backgroundColor=[UIColor yellowColor];
    [self.window addSubview:yellowView];
    
    UIView *blueView =[[UIView alloc]initWithFrame:CGRectMake(20,50, 100, 100)];
    blueView.backgroundColor=[UIColor blueColor];
    [self.window addSubview:blueView];
    
    redView.clipsToBounds = YES;//父视图来裁剪//放到blueView没有alloc之前都可以
    NSArray *views =self.window.subviews;
    NSLog(@"%p",views);
    NSLog(@"%p %p",redView,yellowView);
    
    
    [redView addSubview:blueView];
    
    redView.tag=101;
    blueView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;//Bottom底部
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    NSLog(@"%p",blueView.superview);
    
    UIView *parentView = redView.superview;
    NSLog(@"%p %p",parentView,self.window);
#endif
    
    
    [self createGameObj];

    
    self.window.backgroundColor = [UIColor cyanColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)updateTimer
{
    UIView *view =[self.window viewWithTag:101];
    CGRect rect =CGRectMake(view.frame.origin.x+5, view.frame.origin.y, view.frame.size.width+5, view.frame.size.height+5);
    view.frame=rect;

}
-(void)pressBtn
{
    //[self createGameObj];

}

-(void)createGameObj
{
    [self createBackGound];
    //[self createChess];
    [self createTimer];
}
-(void)createBackGound
{
    for (int i =0 ; i<8; i++)
    {
        for (int j =0;j<8 ; j++)
        {
            if ((i+j)%2==0)
            {
                UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0+40*j, 20+40*i ,40, 40)];
                view.backgroundColor=[UIColor blackColor];
              
                [self.window addSubview:view];
//                if (i==0&&j==0)
//                {
//                    UIView *view =[[UIView alloc ]initWithFrame:CGRectMake(0, 20, 40, 40)];
//                    view.backgroundColor=[UIColor redColor];
//                    [self.window addSubview:view];
//                    
//                }
                
            }
            else
            {
                UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0+40*j, 20+40*i, 40, 40)];
                view.backgroundColor =[UIColor whiteColor];
              
                [self.window addSubview:view];
               
            }
        }
    }
}

-(void)createChess
{
    NSArray * array =@[@"车",@"马",@"象",@"王",@"后",@"象",@"马",@"车",@"兵",@"兵",@"兵",@"兵",@"兵",@"兵",@"兵",@"兵"];
    
    for (int j=0; j<2; j++)
    {
        for (int i=0;i<array.count; i++)
        {
          UIButton * btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
            if (i<(array.count/2))
            {
                if (j==0)
                {
                    [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
                    btn.frame = CGRectMake(0+40*i, 20, 40, 40);
                }
                else
                {
                    [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
                    btn.frame = CGRectMake(0+40*i, 300, 40, 40);
                 
                }
                
            }
            else
            {
                if (j==0)
                {
                    [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
                    btn.frame=CGRectMake(0+40*(i-8), 60, 40, 40);
                }
                else
                {
                    [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
                    btn.frame=CGRectMake(0+40*(i-8), 260, 40, 40);
                }
            }
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
   
            [self.window addSubview:btn];
        }
    }
    
}
-(void)createTimer
{

    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 20, 40, 40)];
    view.backgroundColor =[UIColor redColor];
    view.tag=1001;
    [self.window addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"开" forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 400, 50, 50);
    btn.backgroundColor=[UIColor orangeColor];
    [btn addTarget:self action:@selector(pressbtn) forControlEvents:UIControlEventTouchUpInside];
    btn.tag=999;
    [self.window addSubview:btn];
    
    
   _timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(upDateTimer) userInfo:nil repeats:YES];

    
}
-(void)pressbtn
{
    UIButton *btn = (UIButton *)[self.window viewWithTag:999];
    if (btn.tag==999)
    {
        if ([btn.titleLabel.text isEqualToString:@"开"])
        {
            [_timer setFireDate:[NSDate distantFuture]];
            [btn setTitle:@"关" forState:UIControlStateNormal];
        }
        else
        {
            [_timer setFireDate:[NSDate distantPast]];
            [btn setTitle:@"开" forState:UIControlStateNormal];
            
        }
    }
}
-(void)upDateTimer
{
    static int i = 0;
    static int a = 1;
    static int b = 1;
    static int d = 1;
    UIView *view = [self.window viewWithTag:1001];
    float x=  view.frame.origin.x;
    float y = view.frame.origin.y;
    float width = view.frame.size.width;
    float height =view.frame.size.height;
//    NSLog(@"view.frame.origin.x=%f view.frame.origin.y=%f",x,y);
//    if(a==0)
//    {
//       
//        if (x==0&&y==20)
//        {
//            b=2;
//        }
//        
//        UIView *view =[self.window viewWithTag:b--];
//        
//        //view.backgroundColor=[UIColor clearColor];
//        [view removeFromSuperview];
//         NSLog(@"%d",view.tag);
//        if (b==0)
//        {
//            a=1;
//            
//        }
//        
//    }
//    else
//    {
//
//       UIView * view2=[[UIView alloc]initWithFrame:view.frame];
//        view2.tag=b++;
//        view2.backgroundColor=[UIColor redColor];
//        [self.window addSubview:view2];
//                NSLog(@"%d",view2.tag);
//        if (x==0&&y==20)
//        {
//            b=1;
//        }
//  
//    }
//    NSArray * array = self.window.subviews;
//    NSLog(@"%d",array.count);
    if (a>=1&&a<=64)
    {
//        if (d==1)
//        {
//            NSLog(@"一区");
//        }
        UIView * view2=[[UIView alloc]initWithFrame:view.frame];
        view2.tag=++d;
        // NSLog(@"view2.tag:%d",view2.tag);
//        NSArray*array =@[[UIColor orangeColor],[UIColor blueColor],[UIColor greenColor],[UIColor purpleColor],[UIColor brownColor]];
//        int arcNum = arc4random()% array.count;
        view2.backgroundColor= [UIColor redColor];
        [self.window addSubview:view2];
        
    }
    else if (b>=1&&b<=64)
    {
        UIView *view21 =[self.window viewWithTag:d--];
//         NSLog(@"view21.tag:%d",view21.tag);
//        NSLog(@"d:%d",d);
        [view21 removeFromSuperview];
        if (d==1)
        {
           // NSLog(@"清除1区");
            UIView *view22=[self.window viewWithTag:1];
            [view22 removeFromSuperview];
        }
    }
    
    if (i==0)
    {
        
        CGRect rect =CGRectMake(x+40, y, width, height);
       
        view.frame=rect;
        
        if (x+40==280)
        {
            i=1;
        }
        ++a;
        b=0;
    }
    else if (i==1)
    {
    
        CGRect rect =CGRectMake(x, y+40, width, height);
        view.frame=rect;
        if (y+40==300)
        {
            i=2;
        }
         ++a;
    }
    else if (i==2)
    {
    
        CGRect rect =CGRectMake(x-40, y, width, height);
        view.frame=rect;
        if (x-40==0)
        {
            i=3;
        }
         ++a;
    }
    else if(i==3)
    {
        CGRect rect =CGRectMake(x ,y-40, width, height);
        view.frame=rect;
        if (y-40==60)
        {
            i=4;
        }
         ++a;
    }
    else if(i==4)
    {
        CGRect rect =CGRectMake(x+40 ,y, width, height);
        view.frame=rect;
        if (x+40==240)
        {
            i=5;
        }
         ++a;
    }
    else if(i==5)
    {
        CGRect rect =CGRectMake(x ,y+40, width, height);
        view.frame=rect;
        if (y+40==260)
        {
            i=6;
        }
          ++a;
    }
    else if(i==6)
    {
        CGRect rect =CGRectMake(x-40 ,y, width, height);
        view.frame=rect;
        if (x-40== 40)
        {
            i=7;
        }
         ++a;
    }
    else if(i==7)
    {
        CGRect rect =CGRectMake(x ,y-40, width, height);
        view.frame=rect;
        if( y-40== 100)
        {
            i=8;
        }
         ++a;
    }
    else if(i==8)
    {
        CGRect rect =CGRectMake(x+40 ,y, width, height);
        view.frame=rect;
        if( x+40== 200)
        {
            i=9;
        }
          ++a;
    }
    else if(i==9)
    {
        CGRect rect =CGRectMake(x ,y+40, width, height);
        view.frame=rect;
        if( y+40== 220)
        {
            i=10;
        }
        ++a;
    }
    else if(i==10)
    {
        CGRect rect =CGRectMake(x-40 ,y, width, height);
        view.frame=rect;
        if( x-40== 80)
        {
            i=11;
        }
        ++a;
    }
    else if(i==11)
    {
        CGRect rect =CGRectMake(x ,y-40, width, height);
        view.frame=rect;
        if( y-40== 140)
        {
            i=12;
        }
         ++a;
    }
    else if(i==12)
    {
        CGRect rect =CGRectMake(x+40 ,y, width, height);
        view.frame=rect;
        if( x+40== 160)
        {
            i=13;
        }
         ++a;
    }
    else if(i==13)
    {
        CGRect rect =CGRectMake(x ,y+40, width, height);
        view.frame=rect;
        if( y+40== 180)
        {
            i=14;
        }
        ++a;
    }
    else if(i==14)
    {
        CGRect rect =CGRectMake(x-40 ,y, width, height);
        view.frame=rect;
        if( x-40== 120)
        {
            i=15;
            b=1;
        }
        
         ++a;
        // NSLog(@"a:%d",a);
         a=0;
        
        
    }
    else if(i==15)
    {
        CGRect rect=CGRectMake(x+40, y, width, height);
        view.frame=rect;
        if (x+40==160)
        {
            i=16;
        }
        ++b;
       // NSLog(@"b:%d",b);

    }
    else if(i==16)
    {
        CGRect rect=CGRectMake(x, y-40, width, height);
        view.frame=rect;
        if (y-40==140)
        {
            i=17;
        }
        ++b;
       // NSLog(@"b:%d",b);


    }
    else if(i==17)
    {
        CGRect rect=CGRectMake(x-40, y, width, height);
        view.frame=rect;
        if (x-40==80)
        {
            i=18;
        }
        ++b;
       // NSLog(@"b:%d",b);

      

    }
    else if(i==18)
    {
        CGRect rect=CGRectMake(x, y+40, width, height);
        view.frame=rect;
        if (y+40==220)
        {
            i=19;
        }
        ++b;
       // NSLog(@"b:%d",b);


    }
    else if(i==19)
    {
        CGRect rect=CGRectMake(x+40, y, width, height);
        view.frame=rect;
        if (x+40==200)
        {
            i=20;
        }
        ++b;
       // NSLog(@"b:%d",b);


    }
    else if(i==20)
    {
        CGRect rect=CGRectMake(x, y-40, width, height);
        view.frame=rect;
        if (y-40==100)
        {
            i=21;
        }
        ++b;
        //NSLog(@"b:%d",b);


    }
    else if(i==21)
    {
        CGRect rect=CGRectMake(x-40, y, width, height);
        view.frame=rect;
        if (x-40==40)
        {
            i=22;
        }
        ++b;
       //NSLog(@"b:%d",b);


    }
    else if(i==22)
    {
        CGRect rect=CGRectMake(x, y+40, width, height);
        view.frame=rect;
        if (y+40==260)
        {
            i=23;
        }
        ++b;
        //NSLog(@"b:%d",b);


    }
    else if(i==23)
    {
        CGRect rect=CGRectMake(x+40, y, width, height);
        view.frame=rect;
        if (x+40==240)
        {
            i=24;
        }
        ++b;
        //NSLog(@"b:%d",b);


    }
    else if(i==24)
    {
        CGRect rect=CGRectMake(x, y-40, width, height);
        view.frame=rect;
        if (y-40==60)
        {
            i=25;
        }
        ++b;
        //NSLog(@"b:%d",b);


    }
    else if(i==25)
    {
        CGRect rect=CGRectMake(x-40, y, width, height);
        view.frame=rect;
        if (x-40==0)
        {
            i=26;
        }
        ++b;
       // NSLog(@"b:%d",b);


    }
    else if(i==26)
    {
        CGRect rect=CGRectMake(x, y+40, width, height);
        view.frame=rect;
        if (y+40==300)
        {
            i=27;
        }
        ++b;
       // NSLog(@"b:%d",b);


    }
    else if(i==27)
    {
        CGRect rect=CGRectMake(x+40, y, width, height);
        view.frame=rect;
        if (x+40==280)
        {
            i=28;
        }
        ++b;
       // NSLog(@"b:%d",b);


    }
    else if(i==28)
    {
        CGRect rect=CGRectMake(x, y-40, width, height);
        view.frame=rect;
        if (y-40==20)
        {
            i=29;
        }
        ++b;
       // NSLog(@"b:%d",b);


    }
    else if(i==29)
    {
        CGRect rect=CGRectMake(x-40, y, width, height);
        view.frame=rect;
        if (x-40==0)
        {
            i=0;
            a=1;
        }
        ++b;
       // NSLog(@"b:%d",b);
        
        
        
       
      

    }


    
//    [self presentViewController:sub animated:YES completion:nil];
//    
//
//    [self dismissViewControllerAnimated:YES completion:nil];


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
