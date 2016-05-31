//
//  AppDelegate.m
//  Sunday_9.7
//
//  Created by qianfeng on 14-9-7.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    int _count;

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    _count=1;
    //[self createGameObj];
    //[self createView];
    [self createView];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)createView
{
#if 0
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(20, 30, 200, 300)];
   // view.backgroundColor=[UIColor redColor];
    view.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:1];
   // view.backgroundColor=[UIColor clearColor];
   // view.alpha=0.1;
    [self.window addSubview:view];
    
   
    UIView *view1 =[[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    view1.backgroundColor=[UIColor magentaColor];
    //view1.alpha=0;
    [view addSubview:view1];
    
    
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(20, 300, 100, 100)];
    label.text=@"结婚";
    label.backgroundColor=[UIColor clearColor];
    label.alpha = 0;
    [self.window addSubview:label];
#endif
#if 0
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(20, 30, 200, 300)];
    view.backgroundColor=[UIColor brownColor];
    
    [self.window addSubview:view];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:3];
    view.frame=CGRectMake(100, 100, 100, 100);
    
    [UIView setAnimationDelegate:self];//开始和已经结束的方法要设置代理
    
    [UIView setAnimationWillStartSelector:@selector(animateStart)];
    [UIView setAnimationDidStopSelector:@selector(animateStop)];
    
    [UIView commitAnimations];
#endif
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸开始");
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:nil];
    NSLog(@"%f %f",point.x,point.y);
    NSArray *array =@[[UIColor orangeColor],[UIColor magentaColor],[UIColor cyanColor],[UIColor redColor],[UIColor blackColor],[UIColor greenColor],[UIColor clearColor],[UIColor blueColor]];
    int num =arc4random() %array.count;//随机值有可能前一个和后一个一样，这样从模拟器中看起来，好像没有变化，因为颜色一样
    NSLog(@"%d",num);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 0, 0)];
    view.backgroundColor=array[num];
    [self.window addSubview:view];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    view.frame =CGRectMake(0, 0,320, 480);

    [UIView commitAnimations];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"移动");
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{

    NSLog(@"触摸取消");
}

-(void)animateStart
{
    NSLog(@"Animation will start");
}
-(void)animateStop
{
   NSLog(@"Animation has finished");
}
#if 0
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:nil];
    NSLog(@"%f %f",point.x,point.y);
    UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"警告" message:@"电池电量低" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];//@"忽略",@"其他",
    [alertView show];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"当前点击的是第%d个按钮",buttonIndex);
}
-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"当前点击的是第%d个按钮，视图即将消失",buttonIndex);
    NSLog(@"%@",NSStringFromSelector(_cmd));//NSStringFromSelector是NS开头
    
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"当前点击的是第%d个按钮，视图已经消失",buttonIndex);
}
#endif
#if 0
-(void)createView
{
    UIView *view1 =[[UIView alloc]initWithFrame:CGRectMake(20, 30, 200, 200)];
    view1.backgroundColor=[UIColor purpleColor];
    [self.window addSubview:view1];
    
    UIView *view2=[[UIView alloc ]initWithFrame:CGRectMake(40, 80, 200, 300)];
    view2.backgroundColor=[UIColor lightGrayColor];
    [self.window addSubview:view2];
    
    
    [self.window bringSubviewToFront:view1];
    [self.window  sendSubviewToBack:view1];
    
    UIView *view3 =[[UIView alloc]initWithFrame:CGRectMake(70, 10, 200, 300)];
    view3.backgroundColor=[UIColor orangeColor];
    [self.window addSubview:view3];
    
    [self.window insertSubview:view3 atIndex:1];
    [self.window insertSubview:view3 aboveSubview:view2];
    [self.window insertSubview:view3 belowSubview:view2];
    
    [self.window exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
    
    //[view3 removeFromSuperview];
    [self moveVieworDelete];
    
    
}

-(void)moveVieworDelete
{
    NSArray *array =@[@"前置",@"后置",@"Delete"];
    for (int i = 0; i<array.count; i++)
    {
        UIButton * btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.backgroundColor=[UIColor redColor];
         btn.frame=CGRectMake(10+60*i,400 , 50, 50);
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        //btn.titleLabel.font=[UIFont systemFontOfSize:15];
       
        [btn addTarget:self action:@selector(pressbtn:) forControlEvents:UIControlEventTouchUpInside];
         btn.tag=101+i;
       
        [self.window addSubview:btn];
    }
}
-(void)pressbtn:(id)obj
{
    UIButton *btn =(UIButton *)obj;
    if (btn.tag==101)
    {
        NSLog(@"%d",self.window.subviews.count);//注意self.window.subviews.count的个数为是view和button的总和！！！
    
        for (int i=0; i<self.window.subviews.count-4; i++)
        {
            [self.window exchangeSubviewAtIndex:i withSubviewAtIndex:i+1];
        }
    }
    else if (btn.tag==102)
    {
        for (int i=self.window.subviews.count-4; i>0; i--)
        {
            [self.window exchangeSubviewAtIndex:i withSubviewAtIndex:i-1];
        }
    }
    else if(btn.tag==103)
    {
        static int num = 2;
        if (num>=0)
        {
             [self.window.subviews[num--] removeFromSuperview];
        }
       
    }
}
-(void)createGameObj
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:36];
    for (int i=0; i<18; i++)
    {
        int count = arc4random() %7+1;
        NSNumber *number =[NSNumber numberWithInt:count];
        [array addObject:number];
        [array addObject:number];
    }
    for (int i = 0; i<6; i++)
    {
        for (int j = 0; j<6; j++)
        {
            UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];//UIButtonTypeRoundedRect,UIButtonTypeContactAdd...为什么只能自定义才行
            int arcnum = arc4random()%array.count;
            int num= [array[arcnum] intValue];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",num]] forState:UIControlStateNormal];
            if (i<=2)
            {
                if (j<=2)
                {
                     btn.frame=CGRectMake(10+50*i, 50+50*j-200, 50, 50);
                }
                else
                {
                     btn.frame=CGRectMake(10+50*i-160, 50+50*j, 50, 50);
                }
            }
            else
            {
                if (j<=2)
                {
                    btn.frame=CGRectMake(10+50*i, 50+50*j-200, 50, 50);
                }
                else
                {
                    btn.frame=CGRectMake(10+50*i+160, 50+50*j, 50, 50);
                }
            }
            //btn.frame=CGRectMake(0, 0, 50, 50);
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:2];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            if(i==0&&j==0&&_count==1)
            {
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDidStopSelector:@selector(animationStop)];
            }
            btn.frame=CGRectMake(10+50*i, 50+50*j, 50, 50);
            btn.tag=num;
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            [UIView commitAnimations];
            [self.window addSubview:btn];
            [array removeObjectAtIndex:arcnum];
        }
    }
}
-(void)animationStop
{                                                                                                   //设为空，
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"游戏即将开始" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
}
-(void)pressBtn:(id)obj
{
    static UIButton *btn=nil;
    UIButton* pressBtn = (UIButton*)obj;
    static int i=0;
    if (btn==nil)//这样设置的话，如果是第一次点击，就不能再次点击这个图片
    {
        btn=pressBtn;
        pressBtn.enabled=NO;
    }
    else
    {
        if (btn.tag==pressBtn.tag)
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0];
            btn.frame=CGRectMake(-50, 0, 50, 50);
            pressBtn.frame=CGRectMake(320, 0, 50, 50);
            [UIView commitAnimations];
            btn=nil;//如果不将第一次点击的的设为nil，那么这种情况下，再次点击和前面两个消失的图片一样的图片时，则为第三次点击，而如果点击的和前面两个消失的的图片不一样的图片时，同样也不是新的第一次的点击了，所以将第一次点击的设个nil，以便后面取到新的第一次点击的
            i+=2;
            if (i==36)
            {
                [self  animationStart];
                i=0;
            }
        }
        else
        {
            btn.enabled=YES;//如果点击不相同，则把第一次设为可以点击的
            btn=nil;//同上面一样，也要娶到新的第一次点击，就要把原来的第一次点击设为nil
        }
    }
}
- (void)animationStart
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"游戏结束" delegate:self cancelButtonTitle:@"重新开始" otherButtonTitles: nil ];
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _count++;
    NSLog(@"%d",_count);
    [self createGameObj];
    _count--;
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
