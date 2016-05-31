//
//  SubViewController.m
//  Monday_9.29_6
//
//  Created by qianfeng on 14-9-29.
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.target respondsToSelector:self.action])
    {
        [self.target performSelector:self.action withObject:[UIColor blackColor]];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"子视图消失");
    }];
}
-(void)addTarget:(id)object Selector:(SEL)selector
{
    self.target = object;
    self.action = selector;
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
