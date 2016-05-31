//
//  LimitViewController.m
//  MonDay_9.22
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "LimitViewController.h"

@interface LimitViewController ()

@end

@implementation LimitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         [self createTabBarItemWithTitle:@"限免" Image:[UIImage imageNamed:@"btn_限免_正常"] SelectedImage:[UIImage imageNamed:@"btn_限免_点击"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setTitle:@"限免"];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"顶部条背景"] forBarMetrics:UIBarMetricsDefault];
    [self createLeftBarButtonItemWithTitle:@"分类" ItemStyle:UIBarButtonItemStylePlain Target:self action:@selector(leftPress)];
    [self createRightBarButtonItemWithTitle:@"设置" ItemStyle:UIBarButtonItemStylePlain Target:self action:@selector(rightPress)];
    [self createTableView];
}
-(void)leftPress
{

}
-(void)rightPress
{
    
}
-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = @"limitCellID";
    UITableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
