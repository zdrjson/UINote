//
//  SubViewController.m
//  Saturday_9.13
//
//  Created by qianfeng on 14-9-13.
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
    self.view.backgroundColor =[UIColor magentaColor];
    ImageNameDataModel *dm =[[ImageNameDataModel alloc]init];
    
    
    UIScrollView *sv =[[UIScrollView alloc] init];
    sv.frame = CGRectMake(20, 30, 280, 420);
    sv.pagingEnabled = YES;//按页翻
    sv.alwaysBounceHorizontal = YES;
    sv.showsHorizontalScrollIndicator = YES;
    sv.bounces = YES;
    sv.contentSize = CGSizeMake(280* [[dm.arrayImage objectAtIndex:_curIndex] count], 420);
    [self.view addSubview:sv];
    for (int i = 0; i<[[dm.arrayImage objectAtIndex:_curIndex] count];i++)
    {
        UIImage *image =[UIImage imageNamed:dm.arrayImage[_curIndex][i]];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:image];
        imageView.frame =CGRectMake(0+280*i, 0, 280, 420);
        imageView.userInteractionEnabled = YES;
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
