//
//  RootViewController.m
//  Friday_9.12
//
//  Created by qianfeng on 14-9-12.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
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
    self.view.backgroundColor =[UIColor redColor];
//    for (int i =0; i<9; i++)
//    {
//        UIImage *image =[UIImage imageNamed:[NSString stringWithFormat:@"17_%d.jpg",i+1]];
//        UIImageView * imageView =[[UIImageView alloc]initWithImage:image];
//        imageView.frame =CGRectMake((i%3)*90+30,(i/3)*130+40, 80, 120);
//        [self.view addSubview:imageView];
//    }
    for (int i=0; i<9; i++)
    {
        UIImage * image =[UIImage imageNamed:[NSString stringWithFormat:@"17_%d.jpg",i+1]];
        UIImageView * imageView =[[UIImageView alloc] initWithImage:image];
        imageView.frame=CGRectMake(30+(i%3)*90,40+(i/3)*130, 80, 120);
        [self.view addSubview:imageView];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SubViewController *sub= [[SubViewController alloc]init];
    sub.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
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
