//
//  RootViewController.m
//  Saturday_9.13
//
//  Created by qianfeng on 14-9-13.
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
    ImageNameDataModel * dm =[ImageNameDataModel shareImageNameDataModel];
    self.view.backgroundColor = [UIColor redColor];
    
    UIScrollView *sv =[[UIScrollView alloc] init];
    sv.frame =CGRectMake(20, 30, 280, 350);
    sv.pagingEnabled =YES;//按页翻
    sv.bounces = YES;
    sv.alwaysBounceVertical = YES;
    sv.showsVerticalScrollIndicator = YES;
    sv.contentSize = CGSizeMake(280, 350);
    [self.view addSubview:sv];
     //NSLog(@"%d",dm.arrayImage.count);
    for (int i = 0;i<dm.arrayImage.count; i++)
    {
       
        UIImage *image =[UIImage imageNamed:[dm.arrayImage[i] objectAtIndex:0]];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(280/3*(i%3),350/3*(i/3) , 280/3, 350/3);
        imageView.userInteractionEnabled = YES;
        imageView.tag = 101+i;
        [sv addSubview:imageView];
        
        UITapGestureRecognizer *tapGes =[[UITapGestureRecognizer alloc] init];
        tapGes.numberOfTapsRequired = 1;
        tapGes.numberOfTouchesRequired = 1;
        
        [tapGes addTarget:self action:@selector(tapGes:)];
        [imageView addGestureRecognizer:tapGes];
        
    }
    
    
    
}
-(void)tapGes:(UITapGestureRecognizer *)tapGes
{
    int index = tapGes.view.tag -101;
    SubViewController *sub =[[SubViewController alloc] init];
    sub.curIndex = index;
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
