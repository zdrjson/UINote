//
//  RootViewController.m
//  temp
//
//  Created by qianfeng on 14-9-11.
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
- (void)createImageViews
{
    _imageArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 15; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"17_%d.jpg", i + 1]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(320 * i, 0, 320, 480);
        imageView.userInteractionEnabled = YES;
        [self.view addSubview:imageView];
        [self createSwipeLeftGesture:imageView];
        [self createSwipeRightGesture:imageView];
        
        [_imageArray addObject:imageView];
    }
    _curIndex = 1;
}

- (void)createSwipeRightGesture:(UIImageView *)imageview
{
    UISwipeGestureRecognizer *swipGes = [[UISwipeGestureRecognizer alloc] init];
    swipGes.direction = UISwipeGestureRecognizerDirectionRight;
    [swipGes addTarget:self action:@selector(swipeGesRight:)];
    [imageview addGestureRecognizer:swipGes];
}

- (void)createSwipeLeftGesture:(UIImageView *)imageview
{
    UISwipeGestureRecognizer *swipGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesLeft:)];
    swipGes.direction = UISwipeGestureRecognizerDirectionLeft;
    [imageview addGestureRecognizer:swipGes];
}

- (void)swipeGesRight:(UISwipeGestureRecognizer *)swipeGes
{
    _curIndex--;
    if (_curIndex < 1) {
        _curIndex = 1;
        return;
    }
    
    for (int i = 0; i < _imageArray.count; i++) {
        UIImageView *imageView = _imageArray[i];
        CGRect rect = imageView.frame;
        
        [UIView animateWithDuration:1 animations:^{
            imageView.frame = CGRectMake(rect.origin.x + 320, 0, 320, 480);
        }];
    }
}

-(void)swipeGesLeft:(UISwipeGestureRecognizer *)swipeGes
{
    _curIndex++;
    if (_curIndex > _imageArray.count) {
        _curIndex = _imageArray.count;
        return;
    }
    
    for (int i = 0; i < _imageArray.count; i++) {
        UIImageView *imageView = _imageArray[i];
        CGRect rect = imageView.frame;
        
        [UIView animateWithDuration:1 animations:^{
            imageView.frame = CGRectMake(rect.origin.x - 320, 0, 320, 480);
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
