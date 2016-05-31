//
//  SubViewController.m
//  Thursday_10.2
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "SubViewController.h"
#import "ImageNameDataModel.h"
@interface SubViewController ()

@end

@implementation SubViewController

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
//    self.view.backgroundColor = [UIColor brownColor];
    ImageNameDataModel * imageName = [ImageNameDataModel shareImageNameData];
    NSArray * arr = imageName.imageNameArray[_curIndex];
    
    UIScrollView * sv = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 30, 300, 420)];
    sv.bounces = NO;
    sv.contentSize = CGSizeMake(300 *arr.count, 420);
    [self.view addSubview:sv];
    NSLog(@"%d",arr.count);
    sv.pagingEnabled = YES;
    for (int i = 0 ; i<arr.count; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:arr[i]]];
        imageView.frame = CGRectMake(0+300*i, 0, 300, 420);
        [sv addSubview:imageView];
    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
