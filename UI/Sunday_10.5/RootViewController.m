//
//  RootViewController.m
//  Sunday_10.5
//
//  Created by qianfeng on 14-10-5.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "QFNetWorking.h"
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
    [QFNetWorking sendAsynchronousRequestWithURL:@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1" cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30 completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSLog(@"%@",data);
    }];
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
