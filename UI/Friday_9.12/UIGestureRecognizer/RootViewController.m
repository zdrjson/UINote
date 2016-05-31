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
    [self createImageView];
    [self createTapGesture];
    [self createTapGestureDoubleClick];
}
-(void)createImageView
{
    UIImage *image =[UIImage imageNamed:@"17_7.jpg"];
    _imageView = [[UIImageView alloc]initWithImage:image];
    _imageView.frame = CGRectMake(40, 60, 200, 300);
    _imageView.userInteractionEnabled = YES;//默认不可交互
    [self.view addSubview:_imageView];

}
-(void)createTapGesture
{
    _tapRec =[[UITapGestureRecognizer alloc]init];
    _tapRec.numberOfTapsRequired = 1;
    _tapRec.numberOfTouchesRequired = 1;
    [_tapRec addTarget:self action:@selector(tapRec:)];
    [_imageView addGestureRecognizer:_tapRec];
    
}
-(void)tapRec:(UITapGestureRecognizer *)tapRec
{
   tapRec.view.frame =CGRectMake(0, 0, 320, 480);

}
-(void)createTapGestureDoubleClick
{
    UITapGestureRecognizer * tapDoubleGes =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDoubleGes:)];
    tapDoubleGes.numberOfTapsRequired = 2;
    tapDoubleGes.numberOfTouchesRequired = 1;
    
    [_imageView addGestureRecognizer:tapDoubleGes];
    //单击手势的的成功需要依赖双击手势的失败
    [_tapRec requireGestureRecognizerToFail:tapDoubleGes];
    
    

}
-(void)tapDoubleGes:(UITapGestureRecognizer *)tapDoubleGes
{
    tapDoubleGes.view.frame = CGRectMake(40, 60, 200, 300);

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
