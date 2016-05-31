//
//  RootViewController.m
//  Thursday_10.2
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "ImageNameDataModel.h"
#import "SubViewController.h"
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
    self.view.backgroundColor = [UIColor grayColor];
    ImageNameDataModel * imageName =  [ImageNameDataModel shareImageNameData];
//    NSLog(@"%d",imageName.imageNameArray.count);
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 20, 300, 350)];
    _scrollView.contentSize = CGSizeMake(300, (350/3) * ((imageName.imageNameArray.count-1)/3+1));
    _scrollView.bounces = YES;
    _scrollView.alwaysBounceVertical = YES;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    for (int i = 0; i<imageName.imageNameArray.count; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName.imageNameArray[i][0]]];
//           NSLog(@"%@",imageName.imageNameArray[i][0]);
        imageView.frame = CGRectMake(0+300/3*i, 0+  (350/3) * ((imageName.imageNameArray.count-1)/3), 300/3, 350/3);
        imageView.tag = 101+i;
        [_scrollView addSubview:imageView];
        
        UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
        tapGes.numberOfTapsRequired = 1;
        tapGes.numberOfTouchesRequired = 1;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:tapGes];
       
    }
  
}
-(void)tapGes:(UITapGestureRecognizer *)tapGes
{
    SubViewController * sub = [[SubViewController alloc] init];
    sub.curIndex = tapGes.view.tag - 101;
//    NSLog(@"%d",sub.curIndex);
    sub.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:sub animated:YES completion:nil];
    
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
