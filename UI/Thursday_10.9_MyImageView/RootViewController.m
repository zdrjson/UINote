//
//  RootViewController.m
//  Thursday_10.9_MyImageView
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "MyImageView.h"
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
   self.navigationController.navigationBar.translucent = NO;
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 200 ,100 )];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
//    MyImageView * myImageView = [[MyImageView alloc] initWithImage:[UIImage imageNamed:@"image3"]];
//    [myImageView addSingleTarget:self action:@selector(myImageViewSingleClicked:)];
//    [myImageView addDoubleTarget:self action:@selector(myImageViewDoubleClicked:)];
//    [self.view addSubview:myImageView];
}
-(void)myImageViewSingleClicked:(MyImageView *)myImageView
{
    NSLog(@"单击");

}
-(void)myImageViewDoubleClicked:(MyImageView *)myImageView
{
    NSLog(@"双击");
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
