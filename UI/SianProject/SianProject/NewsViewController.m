//
//  NewsViewController.m
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

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
    self.title = @"News";
//    self.navigationController.navigationBar.translucent = NO;
    _titleArray = [NSMutableArray arrayWithObjects:@"头条",@"体育",@"娱乐圈",@"财经",@"科技界",@"更多", nil];
    CGRect rect = CGRectMake(0, 64, 320, 30);
    _cv = [[ColumnView alloc] initWithFrame:rect];
    _cv.delegate = self;
    _cv.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_cv];
//    NSLog(@"run in line %s %d",__func__,__LINE__);
    
}
-(NSInteger)numberOfColumnView:(ColumnView *)columnView
{
    return _titleArray.count;

}
-(NSString *)columnView:(ColumnView *)columnView atIndex:(NSInteger)index
{
    return [_titleArray objectAtIndex:index];
    
}
-(void)columnView:(ColumnView *)columnView didSelectedAtIndex:(NSInteger)index
{
    
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
