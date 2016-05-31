//
//  RootViewController.m
//  Sunday_9.14
//
//  Created by qianfeng on 14-9-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"17_8.jpg"];
    UIImageView * imageView =[[UIImageView alloc]initWithImage:image];
    imageView.frame =CGRectMake(20, 30, 200, 300);
    imageView.tag = 101;
    [self.view addSubview:imageView];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =[touches anyObject];
//    CGPoint point =[touch locationInView:self.view];
//    NSLog(@"%@",NSStringFromCGPoint(point));
    point= [touch locationInView:self.view];
    
#if 0
    if (touch.tapCount==1) {
               [self performSelector:@selector(touchOnce) withObject:nil afterDelay:0.3];
    }
    else if(touch.tapCount==2)
    {
        
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(touchOnce) object:nil];
        UIImageView *imageView =(UIImageView *)[self.view viewWithTag:101];
        imageView.frame = CGRectMake(20, 30, 200, 300);

    
    }
    
#else
    
    if (touch.tapCount==2) {
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(touchOnce) object:nil];
    }
    
    
    
#endif
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIImageView * imageView =(UIImageView *)[self.view viewWithTag:101];
    UITouch *touch = [touches anyObject];
    CGPoint curPoint =[touch locationInView:self.view];
    
    float x = curPoint.x - point.x;
    float y = curPoint.y - point.y;
    CGRect rect = imageView.frame;
    
    rect.origin.x +=x;
    rect.origin.y +=y;
    
    imageView.frame=rect;
    
    point=curPoint;

    

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch =[touches anyObject];
    UIImageView * imageView =(UIImageView *)[self.view viewWithTag:101];

    if (touch.tapCount==1)
    {
        [self performSelector:@selector(touchOnce) withObject:nil afterDelay:0.3];
    }
    else if(touch.tapCount==2)
    {
        imageView.frame = CGRectMake(20, 30, 200, 300);
    
    }

    
}
-(void)touchOnce
{
    UIImageView *imageView =(UIImageView *)[self.view viewWithTag:101];
    imageView.frame =CGRectMake(0, 0, 320, 480);

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
