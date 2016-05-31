//
//  ViewController.m
//  Saturday_10.18_瀑布流
//
//  Created by qianfeng on 14-10-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "DataItem.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*  category_All.jpg category_Book.jpg category_Business.jpg category_Catalogs.jpg category_Education.jpg category_Pastime.jpg category_Finance.jpg category_FoodDrink.jpg category_Game.jpg category_Health.jpg category_Life.jpg category_Medical.jpg category_Music.jpg category_Gps.jpg category_News.jpg category_Photography.jpg category_Ability.jpg category_Refer.jpg category_Social.jpg category_Sports.jpg category_Travel.jpg category_Tool.jpg category_Weather.jpg */
    [self createData];
    [self createTableViews];
}
-(void)createTableViews
{
//    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 110, 320) style:UITableViewStylePlain];
//     _middelTableView = [[UITableView alloc] initWithFrame:CGRectMake(110, 0, 220, 320) style:UITableViewStylePlain];
//     _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(220, 0, 100, 320) style:UITableViewStylePlain];
    
    
}
-(void)createData
{
    NSArray * arr1 = @[@"category_All.jpg",@"category_Book.jpg",@"category_Business.jpg",@"category_Catalogs.jpg",@"category_Education.jpg",@"category_Pastime.jpg",@"category_Finance.jpg",@"category_FoodDrink.jpg",@"category_Game.jpg",@"category_Health.jpg",@"category_Life.jpg",@"category_Medical.jpg",@"category_Music.jpg",@"category_Gps.jpg",@"category_News.jpg",@"category_Photography.jpg",@"category_Ability.jpg",@"category_Refer.jpg",@"category_Social.jpg",@"category_Sports.jpg",@"category_Travel.jpg",@"category_Tool.jpg",@"category_Weather.jpg"];
    NSLog(@"%d",arr1.count);
    NSMutableArray * arr2 = [NSMutableArray arrayWithArray:arr1];
    [arr2 addObjectsFromArray:arr1];
    NSInteger leftHeight = 160;
    NSInteger middleHeight = 240;
    NSInteger rightHeight = 120;
    
    NSInteger middleRowCount = 30;
    NSInteger leftRowCount = middleHeight * middleRowCount/leftHeight;
    NSInteger rightRowCount = middleRowCount * middleRowCount/rightHeight;
    _leftArrayData = [NSMutableArray array];
    _middleArrayData = [NSMutableArray array];
    _rightArrayData = [NSMutableArray array];
    for (int i = 0; i<leftRowCount; i++) {
        UIImage * image = [UIImage imageNamed:arr2[i]];
        DataItem * item = [[DataItem alloc] init];
        item.rowHeight = leftHeight;
        item.image = image;
        [_leftArrayData addObject:item];
    }
    for (int i = 0; i<middleRowCount; i++) {
        UIImage * image = [UIImage imageNamed:arr2[i]];
        DataItem * item = [[DataItem alloc] init];
        item.rowHeight = middleHeight;
        item.image = image;
        [_middleArrayData addObject:item];
    }
    for (int i = 0; i<rightRowCount; i++) {
        UIImage * image = [UIImage imageNamed:arr2[i]];
        DataItem * item = [[DataItem alloc] init];
        item.rowHeight = rightHeight;
        item.image = image;
        [_rightArrayData addObject:item];
    }
    
}
#pragma mark - uitableview协议方法
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_leftTableView) {
        return _leftArrayData.count;
    }
    else if(tableView==_middleTableView)
    {
        return _middleArrayData.count;
    }
    else
    {
        return _rightArrayData.count;
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellName = @"cellName";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.tag = 1234;
        [cell.contentView addSubview:imageView];
    }
    
    
    UIImageView * imageView = (UIImageView *)[cell.contentView viewWithTag:1234];
    if (tableView==_leftTableView) {
        DataItem * item = _leftArrayData[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 75, 156);
        
    }
    else if(tableView==_middleTableView)
    {
        DataItem * item = _middleArrayData[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 156, 236);
    }
    else
    {
        DataItem * item = _rightArrayData[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 76, 116);
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_leftTableView) {
        DataItem * item = _leftArrayData.lastObject;
        
        return item.rowHeight;
    }
    else if (tableView==_middleTableView)
    {
        DataItem * item = _middleArrayData.lastObject;
        return item.rowHeight;
    }
    else
    {
        DataItem * item = _rightArrayData.lastObject;
        return item.rowHeight;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
