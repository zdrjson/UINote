//
//  ViewController.m
//  Sunday_10.26_瀑布流
//
//  Created by qianfeng on 14-10-26.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger _leftHeight;
    NSInteger _middleHeight;
    NSInteger _rightHeight;
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
    NSArray * arr1 = @[@"category_All.jpg",@"category_Book.jpg",@"category_Business.jpg",@"category_Catalogs.jpg",@"category_Education.jpg",@"category_Pastime.jpg",@"category_Finance.jpg",@"category_FoodDrink.jpg",@"category_Game.jpg",@"category_Health.jpg",@"category_Life.jpg",@"category_Medical.jpg",@"category_Music.jpg",@"category_Gps.jpg",@"category_News.jpg",@"category_Photography.jpg",@"category_Ability.jpg",@"category_Refer.jpg",@"category_Social.jpg",@"category_Sports.jpg",@"category_Travel.jpg",@"category_Tool.jpg",@"category_Weather.jpg"];
    NSMutableArray * arr2 = [NSMutableArray arrayWithArray:arr1];
    [arr2 addObjectsFromArray:arr1];
    
    _leftHeight = 160;
    _middleHeight = 240;
    _rightHeight = 120;
    
    _leftDataArray = [NSMutableArray array];
    _middleDataArray = [NSMutableArray array];
    _rightDataArray = [NSMutableArray array];
    
    for (int i = 0; i<arr2.count; i++) {
        UIImage * image = [UIImage imageNamed:arr2[i]];
        DataItem * item = [[DataItem alloc] init];
        item.rowHeight = _leftHeight;
        item.image = image;
        [_leftDataArray addObject:item];
    }
    for (int i = 0; i<arr2.count; i++) {
        UIImage * image = [UIImage imageNamed:arr2[i]];
        DataItem * item = [[DataItem alloc] init];
        item.rowHeight = _middleHeight;
        item.image = image;
        [_middleDataArray addObject:item];
    }
    for (int i = 0; i<arr2.count; i++) {
        UIImage * image = [UIImage imageNamed:arr2[i]];
        DataItem * item = [[DataItem alloc] init];
        item.rowHeight = _rightHeight;
        item.image = image;
        [_rightDataArray addObject:item];
    }
    
    
}
-(void)uiConfig
{
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 110, 480) style:UITableViewStylePlain];
    _middelTableView = [[UITableView alloc] initWithFrame:CGRectMake(110, 0, 110, 480) style:UITableViewStylePlain];
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(220, 0, 100, 480) style:UITableViewStylePlain];
    _leftTableView.dataSource = self;
    _leftTableView.delegate = self;
    _middelTableView.dataSource= self;
    _middelTableView.delegate = self;
    _rightTableView.dataSource = self;
    _rightTableView.delegate = self;
    [self.view addSubview:_leftTableView];
    [self.view addSubview:_middelTableView];
    [self.view addSubview:_rightTableView];
    _leftTableView.showsVerticalScrollIndicator = NO;
    _middelTableView.showsVerticalScrollIndicator = NO;
}
#pragma mark -UItableView协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_leftTableView) {
        return _leftDataArray.count;
    }
    else if(tableView==_middelTableView)
    {
        return _middleDataArray.count;
    }
    else
    {
        return _rightDataArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"cellid";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.tag = 1026;
        [cell.contentView addSubview:imageView];
    }
    UIImageView * imageView = (UIImageView *)[cell.contentView viewWithTag:1026];
    if (tableView==_leftTableView) {
        DataItem * item = _leftDataArray[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 106, 156);
    }
    else if (tableView==_middelTableView)
    {
        DataItem * item = _middleDataArray[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 106, 236);
    }
    else
    {
        DataItem * item = _rightDataArray[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 96, 116);
        
    }
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_leftTableView) {
        return _leftHeight;
    }
    else if (tableView==_middelTableView)
    {
        return _middleHeight;
    }
    else
    {
        return _rightHeight;
    
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray * arr = @[_leftTableView,_middelTableView,_rightTableView];
    
    for (UIScrollView * s in arr) {
        if (s!=scrollView) {
            s.contentOffset = scrollView.contentOffset;
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
