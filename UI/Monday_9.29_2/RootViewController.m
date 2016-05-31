//
//  RootViewController.m
//  Monday_9.29_2
//
//  Created by qianfeng on 14-9-29.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    NSMutableArray * _dataArray;
    UITableView * _tableView;
    
    UIBarButtonItem * _editItem;
    
    UIBarButtonItem * _doneItem;

}
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
    [self createData];
    [self createTableView];
    [self createBarButtonItem];
   
}
-(void)createBarButtonItem
{
    _editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editPress:)];
    self.navigationItem.rightBarButtonItem = _editItem;
    _doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(donePress:)];
    
}
-(void)editPress:(UIBarButtonItem *)editPress
{
    [_tableView setEditing:YES animated:YES];
    self.navigationItem.rightBarButtonItem = _doneItem;
}
-(void)donePress:(UIBarButtonItem *)donePress
{
    [_tableView setEditing:NO animated:YES];
    self.navigationItem.rightBarButtonItem = _editItem;

}
#pragma mark -tableView插入删除相关方法
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [_dataArray[indexPath.section] removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
        
    }
    else if(editingStyle==UITableViewCellEditingStyleInsert)
    {
        [_dataArray[indexPath.section] insertObject:@"Anew" atIndex:indexPath.row];
        [_tableView reloadData];
        
    }
}
#pragma mark -移动相关协议方法
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
   NSString * str = _dataArray[sourceIndexPath.section][sourceIndexPath.row];
    [_dataArray[sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
    [_dataArray[destinationIndexPath.section] insertObject:str atIndex:destinationIndexPath.row];
    
}
#pragma mark -索引相关方法
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    [array addObject:@"开始"];
    for (int i = 0; i<26; i++) {
        NSString * str = [NSString stringWithFormat:@"%c",'A'+i];
        [array addObject:str];
    }
    [array addObject:@"结束"];
    return array;
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if ([title isEqualToString:@"开始"]) {
        return index;
    }
    else if([title isEqualToString:@"结束"])
    {
        return index-2;
    }
    else
    {
        return index;
    }
    
}
-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
#pragma mark -Data-
-(void)createData
{
    _dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<26; i++) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (int j = 0; j<5; j++) {
            NSString * str = [NSString stringWithFormat:@"%c%d",'A'+i,j];
            [arr addObject:str];
        }
        [_dataArray addObject:arr];
    }
//    NSLog(@"%@",_dataArray);

}
#pragma mark -UITableView协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_dataArray objectAtIndex:section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    return cell;
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
