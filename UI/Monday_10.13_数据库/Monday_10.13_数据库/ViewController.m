//
//  ViewController.m
//  Monday_10.13_数据库
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
#import "DBManager.h"
#import "AddEditViewController.h"
@interface ViewController ()
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareData];
    [self uiConfig];
	
}
-(void)prepareData
{
    _dataArray = [[DBManager sharedManager] fetchAll];
}
-(void)refreshData
{
    _dataArray = [[DBManager sharedManager] fetchAll];
    [_tableView reloadData];
}
-(void)uiConfig
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction)];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}
-(void)addAction
{
//    [_tableView setEditing:YES animated:YES];
//    return;
    AddEditViewController * addVc = [[AddEditViewController alloc] initWithNibName:@"AddEditViewController" bundle:nil]
    ;
    __unsafe_unretained AddEditViewController * add = addVc;
    [addVc setAddcb:^{
        [[DBManager sharedManager] insertUser:add.model];
        [self refreshData];
//        [_dataArray addObject:add.model];
//        [_tableView reloadData];
    }];
    [self.navigationController pushViewController:addVc animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"cellid";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    cell.textLabel.text = [_dataArray[indexPath.row] userName];
    cell.detailTextLabel.text = [_dataArray[indexPath.row] phoneNumber];
    cell.imageView.image = [_dataArray[indexPath.row] headerImg];
    return cell;
    
}
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"d");
//    return 1;
//}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [[DBManager sharedManager] deleteUser:_dataArray[indexPath.row]];
        [_dataArray removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //修改数据
    AddEditViewController * addVc = [[AddEditViewController alloc] initWithNibName:@"AddEditViewController" bundle:nil]
    ;
    addVc.model = _dataArray[indexPath.row];
    __unsafe_unretained AddEditViewController * add = addVc;
    [addVc setAddcb:^{
        [[DBManager sharedManager] updateUser:add.model];
        [_tableView reloadData];
    }];
    [self.navigationController pushViewController:addVc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
