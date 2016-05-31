//
//  ViewController.m
//  Saturday_11.8_ScrollView
//
//  Created by qianfeng on 14-11-8.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    NSArray * arr = @[@"3",@"1",@"2",@"3",@"1"];
    for (int i = 0; i<5; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.image = [UIImage imageNamed:arr[i]];
        [_scrollView addSubview:imageView];
    }
    _scrollView.contentSize = CGSizeMake(5*self.view.bounds.size.width, self.view.bounds.size.height);
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width, 0);
    [self.view addSubview:_scrollView];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   
    if (scrollView.contentOffset.x==scrollView.bounds.size.width*4) {
//        [scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width, 0, scrollView.bounds.size.width, scrollView.bounds.size.height) animated:NO];
        [scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
        
    }
    if (scrollView.contentOffset.x == 0) {
//        [scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width*3, 0, scrollView.bounds.size.width, scrollView.bounds.size.height) animated:NO];
        [scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
        
    }
    NSLog(@"%f",scrollView.contentOffset.x);

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
