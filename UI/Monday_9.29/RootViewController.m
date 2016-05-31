//
//  RootViewController.m
//  Monday_9.29
//
//  Created by qianfeng on 14-9-29.
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
    [self createImageView];
    [self createSwipeGesture];
}
-(void)createImageView
{
    UIImage * image = [UIImage imageNamed:@"17_11.jpg"];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(20, 50, 100, 300);
    imageView.userInteractionEnabled = YES;
    imageView.tag= 101;
    [self.view addSubview:imageView];
}
#pragma mark -滑动手势
-(void)createSwipeGesture
{
    UISwipeGestureRecognizer * swipeRight = [[UISwipeGestureRecognizer alloc] init];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeRight addTarget:self action:@selector(swipeRight:)];
    
    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:101];
    [imageView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer * swipeLeft = [[UISwipeGestureRecognizer alloc] init];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeLeft addTarget:self action:@selector(swipeLeft:)];
    [imageView addGestureRecognizer:swipeLeft];
    
}
-(void)swipeRight:(UISwipeGestureRecognizer *)swipeRight
{
    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:101];
    
    [UIView animateWithDuration:1 animations:^{
        imageView.frame = CGRectMake(220, 50, 100, 300);
    }];
}
-(void)swipeLeft:(UISwipeGestureRecognizer *)swipeLeft
{
    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:101];
    
    [UIView animateWithDuration:1 animations:^{
        imageView.frame =  CGRectMake(20, 50, 100, 300);
    }];

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
