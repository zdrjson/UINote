//
//  RootViewController.m
//  Monday_9.29_6
//
//  Created by qianfeng on 14-9-29.
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
    self.view.backgroundColor = [UIColor grayColor];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SubViewController * sub = [[SubViewController alloc] init];
    [sub addTarget:self Selector:@selector(changeColor:)];
    [self presentViewController:sub animated:YES completion:^{
        NSLog(@"子视图显示完毕");
    }];
}
-(void)changeColor:(UIColor *)color
{
    self.view.backgroundColor = color;
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
