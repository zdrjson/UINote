//
//  ViewController.m
//  PageViewController
//
//  Created by qianfeng on 14-10-10.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"
@interface ViewController ()
{
    UIPageViewController * _pageVc;
    NSMutableArray * _dataArray;
    NSInteger _currentPage;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
//    NSLog(@"%@",[[UIDevice currentDevice]systemName]);
//    NSLog(@"%@",[UIDevice currentDevice].systemVersion);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self prepareData];
    _pageVc = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageVc.delegate = self;
    _pageVc.dataSource = self;
    
    SubViewController * sub = [[SubViewController alloc] init];
    sub.view.backgroundColor = [UIColor lightGrayColor];
    _currentPage = 0;
    sub.contentText = _dataArray[_currentPage];
    
    [_pageVc setViewControllers:@[sub] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
       
    }];
    [self.view addSubview:_pageVc.view];
}
-(void)prepareData
{
    _dataArray = [[NSMutableArray alloc] init];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"book" ofType:@"txt"];
    NSString * str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSString * subStr= nil;
    do {
        subStr = [str substringToIndex:600];
        [_dataArray addObject:subStr];
        str = [str substringFromIndex:600];
    } while (str.length>600);
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    _currentPage--;
    if (_currentPage<0) {
        _currentPage=0;
        return nil;
    }
    NSLog(@"before当前是第%d页",_currentPage);
    SubViewController * sub = [[SubViewController alloc] init];
    sub.view.backgroundColor = [UIColor lightGrayColor];
    sub.contentText = _dataArray[_currentPage];
    return sub;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    _currentPage++;
    if (_currentPage>=_dataArray.count) {
        _currentPage=_dataArray.count-1;
        return nil;
    }
    NSLog(@"after当前是第%d页",_currentPage);
    SubViewController * sub = [[SubViewController alloc] init];
    sub.view.backgroundColor = [UIColor lightGrayColor];
    sub.contentText = _dataArray[_currentPage];
    return sub;
    
}
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    SubViewController * sub = previousViewControllers[0];
    NSString * str = sub.contentText;
    NSInteger index = [_dataArray indexOfObject:str];
    NSLog(@"第%d页,%@",index,[str substringToIndex:10]);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
