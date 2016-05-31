//
//  RootViewController.m
//  Friday_9.12
//
//  Created by qianfeng on 14-9-12.
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
    [self createImageViews];
}
-(void)createImageViews
{
    _imageViewArray =  [[NSMutableArray alloc] init];
    for (int i = 0; i<15; i++)
    {
        UIImage *image =[UIImage imageNamed:[NSString stringWithFormat:@"17_%d.jpg",i+1]];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0+320*i, 0, 320, 480)];
        imageView.userInteractionEnabled = YES;
        imageView.image = image;
        [self.view addSubview:imageView];
        [_imageViewArray addObject:imageView];
        
        [self createLeftGesture:imageView];
        [self createRightGesture:imageView];//为每个imageView添加手势
        
    }
    _curIndex = 1;
}
-(void)createRightGesture:(UIImageView *)imageView
{
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesRight:)];
    swipeGes.direction = UISwipeGestureRecognizerDirectionRight;
    [imageView addGestureRecognizer:swipeGes];
    

}
-(void)createLeftGesture:(UIImageView *)imageView
{
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesLeft:)];
    swipeGes.direction = UISwipeGestureRecognizerDirectionLeft;
    [imageView addGestureRecognizer:swipeGes];

}
-(void)swipeGesRight:(UISwipeGestureRecognizer *)swipeGesRight
{
    _curIndex--;
    if (_curIndex<1)
    {
        _curIndex=1;
        return;
    }
    for (int i = 0; i<_imageViewArray.count; i++)
    {
        UIImageView * imageView = _imageViewArray[i];
        CGRect rect = imageView.frame;
        [UIView animateWithDuration:1 animations:^{
            imageView.frame = CGRectMake(rect.origin.x+320, rect.origin.y, rect.size.width, rect.size.height);
          
        }];
    }

}
-(void)swipeGesLeft:(UISwipeGestureRecognizer *)imageView
{
    _curIndex++;
    if (_curIndex>_imageViewArray.count)
    {
        _curIndex = _imageViewArray.count;
        return;
    }
    for (int i = 0; i<_imageViewArray.count; i++)
    {
        UIImageView *imageView = _imageViewArray[i];
        CGRect rect = imageView.frame;
        [UIView animateWithDuration:1 animations:^{
            imageView.frame = CGRectMake(rect.origin.x-320, rect.origin.y, rect.size.width, rect.size.height);
        }];
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
