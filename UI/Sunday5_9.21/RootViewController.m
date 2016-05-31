//
//  RootViewController.m
//  Sunday5_9.21
//
//  Created by qianfeng on 14-9-21.
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
    [self createScrollView];
}
-(void)createScrollView
{
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, 320, 480);
    _scrollView.contentSize = CGSizeMake(320 *3, 480);
    _scrollView.bounces = NO;
    
    _scrollView.pagingEnabled = YES;
    for (int i = 0; i<3; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"17_%d.jpg",i+1]]];
        
        imageView.frame = CGRectMake(self.view.bounds.origin.x+ i*self.view.bounds.size.width,self.view.bounds.origin.y,self.view.bounds.size.width, self.view.bounds.size.height);
        [_scrollView addSubview:imageView];
      
    }
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"111");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    NSLog(@"222");
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
//    NSLog(@"333");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"ddd");
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"444");
}
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
//{
//    NSLog(@"555");
//}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"666");
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
