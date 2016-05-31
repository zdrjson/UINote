//
//  SubViewController.m
//  Friday_9.12
//
//  Created by qianfeng on 14-9-12.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "SubViewController.h"

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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    UIScrollView *sv = [[UIScrollView alloc]init];
    sv.frame = CGRectMake(30, 50, 270, 350);
    sv.contentSize = CGSizeMake(270*10, 350*10);
    //sv.pagingEnabled = YES;
    sv.showsHorizontalScrollIndicator=YES;
    sv.showsVerticalScrollIndicator = YES;
    
    sv.alwaysBounceHorizontal = NO;
    sv.alwaysBounceVertical = NO;
    
    sv.bounces= NO;
    sv.userInteractionEnabled = YES;
    sv.backgroundColor = [UIColor cyanColor];
    
    
    
    sv.delegate= self;
    for (int i = 0; i<10; i++) {
        UIImage * image =[UIImage imageNamed:[NSString stringWithFormat:@"17_%d.jpg",i+1]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(0+270*i, 0, 270, 350);
        [sv addSubview:imageView];
    }
    [self.view addSubview:sv];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%@",NSStringFromSelector(_cmd));

}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
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
