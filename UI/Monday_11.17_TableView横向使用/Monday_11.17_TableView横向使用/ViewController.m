//
//  ViewController.m
//  Monday_11.17_TableView横向使用
//
//  Created by qianfeng on 14-11-17.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _dataArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<7; i++) {
        [_dataArray addObject:[NSString stringWithFormat:@"Default%d",i+1]];
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height,  [[UIScreen mainScreen] bounds].size.width) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
    _tableView.transform = CGAffineTransformRotate(_tableView.transform, -M_PI/2);
    _tableView.pagingEnabled = YES;
    _tableView.center = self.view.center;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid =@"cellid";
    MyCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil]firstObject];
        cell.transform = CGAffineTransformRotate(cell.transform, M_PI/2);
    }
    cell.imgName = _dataArray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UIScreen mainScreen] bounds].size.width;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
