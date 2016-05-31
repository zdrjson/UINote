//
//  FirstViewController.m
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "FirstViewController.h"
#import "MyViewCell.h"
#import "DataModel.h"
#import "ADViewCell.h"
#define DEFINE_UITabBarItem(UITabBarSystemItem,kItemTag,__titleName__)  UITabBarItem * item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItem tag:kItemTag];\
self.tabBarItem = item;\
self.title = __titleName__

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        DEFINE_UITabBarItem(UITabBarSystemItemRecents,0,@"热门App");
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
    [self createTableView];
   
}
-(void)createData
{
//    _dataArray = [[NSMutableArray alloc] init];
//    _aDArray = [[NSMutableArray alloc] init];
    DataModel * dm = [DataModel shareDataModel];
    _dataArray = dm.dataArray;
    _aDArray = dm.aDArray;
//    _array = [NSMutableArray array];
//    
//    NSLog(@"%@",_array);
}
-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        static NSString * cellID = @"cellAdID";
        ADViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[ADViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
             [cell loadAdDataModel:_aDArray];
        }
       
        return cell;
    }
    
    static NSString * cellID = @"cellID";
    MyViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyViewCell" owner:self options:nil]firstObject];
    }
    cell.cellModel = _dataArray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row==0?160:80;
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
