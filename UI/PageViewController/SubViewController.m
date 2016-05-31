//
//  SubViewController.m
//  PageViewController
//
//  Created by qianfeng on 14-10-10.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()
{
    UILabel * _label;
}
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
//    NSInteger 32位系统下是 32位，64为系统下是64位（用long %ld）
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.1*(arc4random()%10) green:0.1*(arc4random()%10) blue:0.1*(arc4random()%10) alpha:1];
    _label = [[UILabel alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_label];
    _label.numberOfLines = 0;
    _label.font = [UIFont systemFontOfSize:12];
}
-(void)setContentText:(NSString *)contentText
{
    _contentText= contentText;
    _label.text = contentText;
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
