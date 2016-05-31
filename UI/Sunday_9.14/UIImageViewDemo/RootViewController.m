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
    UIImage *image =[UIImage imageNamed:@"back2.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    UIImage * imageBird = [UIImage imageNamed:@"DOVE 1.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:imageBird];
    imageView.frame = CGRectMake(20, 30, imageBird.size.width, imageBird.size.height);
    imageView.tag = 101;
    [self.view addSubview:imageView];
    
    NSMutableArray *array =[[NSMutableArray alloc]initWithCapacity:18];
    for (int i = 0; i<18; i++) {
        UIImage *image =[UIImage imageNamed:[NSString stringWithFormat:@"DOVE %d.png",i+1]];
        [array addObject:image];
    }
    imageView.animationImages = array;
    imageView.animationDuration = 0.5;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    NSLog(@"%d",[imageView isAnimating]);
    
    [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
}
-(void)updateTimer
{
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:101];
    if (imageView.frame.origin.x>320)
    {
        imageView.frame = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
    }
    else
    {
        imageView.frame = CGRectMake(imageView.frame.origin.x+6, imageView.frame.origin.y+5, imageView.frame.size.width, imageView.frame.size.height);
    }
    
    
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
