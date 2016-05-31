//
//  RootViewController.m
//  Monday_9.29_4
//
//  Created by qianfeng on 14-9-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

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
    self.view.backgroundColor = [UIColor blackColor];
    [self createStepper];
    [self createSegmentedControl];
    [self createActivityIndicatorView];
}
-(void)createActivityIndicatorView
{
    UIActivityIndicatorView * activityIndicatiorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    activityIndicatiorView.backgroundColor = [UIColor whiteColor];
//    [activityIndicatiorView startAnimating];
    activityIndicatiorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    activityIndicatiorView.tag = 101;
    [self.view addSubview:activityIndicatiorView];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    static BOOL isON = YES;
    NSLog(@"%d",isON);
    UIActivityIndicatorView * activityIndicatiorView = (UIActivityIndicatorView *)[self.view viewWithTag:101];
    if (isON) {
        [activityIndicatiorView startAnimating];
    }
    else
    {
        [activityIndicatiorView stopAnimating];
    }
    isON =!isON;//!!!!!
}
-(void)createSegmentedControl
{
    UISegmentedControl * segmentedCtrl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(100, 200, 150, 50)];
//    segemtedCtrl.backgroundColor = [UIColor grayColor];
    [segmentedCtrl insertSegmentWithTitle:@"5元" atIndex:0 animated:YES];
    [segmentedCtrl insertSegmentWithTitle:@"10元" atIndex:1 animated:YES];
    [segmentedCtrl insertSegmentWithTitle:@"100元" atIndex:0 animated:YES];
    segmentedCtrl.selectedSegmentIndex = 2;
    [segmentedCtrl addTarget:self action:@selector(segmentedValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedCtrl];
    
}
-(void)segmentedValueChanged:(UISegmentedControl *)segmentedValue
{
    NSLog(@"%d",segmentedValue.selectedSegmentIndex);

}
-(void)createStepper
{
    UIStepper * setpper = [[UIStepper alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
  
    setpper.backgroundColor = [UIColor redColor];
    setpper.minimumValue = -1;
    setpper.maximumValue =1001;
    setpper.value = 100;
    [setpper addTarget:self action:@selector(setpperClicked:) forControlEvents:UIControlEventValueChanged];
      [self.view addSubview:setpper];
}

-(void)setpperClicked:(UIStepper *)setpper
{
    NSLog(@"%f",setpper.value);
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
