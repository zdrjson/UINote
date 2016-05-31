//
//  ViewController.m
//  iChat
//
//  Created by qianfeng on 14-10-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
#import "RegisterViewController.h"
#import "ChatEngine.h"
#import "LoginViewController.h"
#import "LoginUserModel.h"
#import "ChatViewController.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
    NSMutableData * _data;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self prepareData];
    [self uiConfig];
}
-(void)prepareData
{
#if 0
    _dataArray = [[NSMutableArray alloc] init];
    _data = [[NSMutableData alloc] init];
    NSURLConnection *conn;
    conn = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[__kHOST stringByAppendingString:__kGET_USER_LIST]]] delegate:self];
//    conn = [[NSURLConnection alloc] initWithRequest:<#(NSURLRequest *)#> delegate:<#(id)#> startImmediately:<#(BOOL)#>]//如果这里BOOL值为NO需要手动启动
#endif
    
    [[ChatEngine sharedEngine] getUrlList:^(NSMutableArray * arr) {
         _dataArray = arr;
        [_tableView reloadData];
    }];
}
-(void)uiConfig
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.title = @"好友列表";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerAction)];
   
    
}
-(void)viewWillAppear:(BOOL)animated
{
    if ([[LoginUserModel user] username].length!=0) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[[LoginUserModel user] usernickname] style:UIBarButtonItemStylePlain target:self action:nil];
    }
    else
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(loginAction)];
//        LoginViewController * loginVc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//        [self.navigationController pushViewController:loginVc animated:NO];
    }
}
#pragma mark --UITableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.textLabel.text = [_dataArray[indexPath.row] username];
    cell.detailTextLabel.text = [_dataArray[indexPath.row] usernickname];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatViewController * chatVc = [[ChatViewController alloc] init];
    chatVc.user = _dataArray[indexPath.row];
    [self.navigationController pushViewController:chatVc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark --Actions
-(void)registerAction
{
    RegisterViewController * rvc = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    //    rvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //    [self presentViewController:rvc animated:YES completion:nil];
    [self.navigationController pushViewController:rvc animated:YES];
}
-(void)loginAction
{
    LoginViewController * loginVc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginVc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
