//
//  RootViewController.m
//  Monday_9.29_5
//
//  Created by qianfeng on 14-9-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    UIImageView * _imageView;
    UITapGestureRecognizer * _tapGes;
}
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
    [self createTapGesture];
    [self createDoubleGesture];
    //旋转手势
    [self createRotationGesture];
    //缩放手势
    [self createPinchGesture];
    //拖动手势
    [self createPanGesture];
    //长按手势
    [self createLongPressGesture];
}

-(void)createImageView
{
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"17_8.jpg"]];
    _imageView.frame = [[UIScreen mainScreen] bounds];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
}
#pragma mark -单击手势
-(void)createTapGesture
{
    _tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
    [_imageView addGestureRecognizer:_tapGes];
}
-(void)tapGes:(UITapGestureRecognizer *)tapGes
{
    _imageView.frame = CGRectMake(50, 45, 100, 100);
}
#pragma mark -双击手势
-(void)createDoubleGesture
{
    UITapGestureRecognizer * doubleTapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGes:)];
    doubleTapGes.numberOfTapsRequired = 2;
    doubleTapGes.numberOfTouchesRequired = 1;
    [_imageView addGestureRecognizer:doubleTapGes];
    //单击手势的成功需要依赖双击手势的失败
    [_tapGes requireGestureRecognizerToFail:doubleTapGes];
}
-(void)doubleTapGes:(UITapGestureRecognizer *)doubleTapGes
{
    _imageView.frame = [UIScreen mainScreen].bounds;
}

#pragma mark - 旋转手势
-(void)createRotationGesture
{
    UIRotationGestureRecognizer * rotGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotGes:)];
    rotGes.delegate =self;
    [_imageView addGestureRecognizer:rotGes];
}
-(void)rotGes:(UIRotationGestureRecognizer *)rotGes
{
    rotGes.view.transform = CGAffineTransformRotate(rotGes.view.transform, rotGes.rotation);
    rotGes.rotation = 0;
}
#pragma mark -缩放手势
-(void)createPinchGesture
{
    UIPinchGestureRecognizer * pinchGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGes:)];
    pinchGes.delegate = self;
    [_imageView addGestureRecognizer:pinchGes];
}
-(void)pinchGes:(UIPinchGestureRecognizer *)pinchGes
{
    pinchGes.view.transform = CGAffineTransformScale(pinchGes.view.transform, pinchGes.scale, pinchGes.scale);
    pinchGes.scale = 1;
    
}
#pragma mark -手势协议相关方法=
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
#pragma mark -拖动手势
-(void)createPanGesture
{
    UIPanGestureRecognizer * panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
    [_imageView addGestureRecognizer:panGes];
}
-(void)panGes:(UIPanGestureRecognizer *)panGes
{
    CGPoint point = [panGes translationInView:self.view];
    panGes.view.transform = CGAffineTransformTranslate(panGes.view.transform, point.x, point.y);
    [panGes setTranslation:CGPointZero inView:self.view];
    
}
#pragma mark -长按手势
-(void)createLongPressGesture
{
    UILongPressGestureRecognizer * longPressGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGes:)];
    longPressGes.minimumPressDuration = 2;
    [_imageView addGestureRecognizer:longPressGes];
}
-(void)longPressGes:(UILongPressGestureRecognizer *)longPressGes
{
    NSLog(@"长按手势触发");
    if (longPressGes.state==UIGestureRecognizerStateBegan) {
        NSLog(@"长按手势开始");
    }
    else if(longPressGes.state==UIGestureRecognizerStateEnded)
    {
        NSLog(@"长按手势结束");
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
