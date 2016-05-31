//
//  ViewController.m
//  Saturday_10.18_1
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
    // Do any additional setup after loading the view, typically from a nib.
    /*  category_All.jpg category_Book.jpg category_Business.jpg category_Catalogs.jpg category_Education.jpg category_Pastime.jpg category_Finance.jpg category_FoodDrink.jpg category_Game.jpg category_Health.jpg category_Life.jpg category_Medical.jpg category_Music.jpg category_Gps.jpg category_News.jpg category_Photography.jpg category_Ability.jpg category_Refer.jpg category_Social.jpg category_Sports.jpg category_Travel.jpg category_Tool.jpg category_Weather.jpg */
    [self createData];
    [self createTableViews];
}
-(void)createTableViews
{
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 110, 480) style:UITableViewStylePlain];
    _middelTableView = [[UITableView alloc] initWithFrame:CGRectMake(110, 0, 110, 480) style:UITableViewStylePlain];
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(220, 0, 100, 480) style:UITableViewStylePlain];
    [self.view addSubview:_leftTableView];
    [self.view addSubview:_middelTableView];
    [self.view addSubview:_rightTableView];
    _leftTableView.dataSource = self;
    _leftTableView.delegate = self;
    _middelTableView.dataSource = self;
    _middelTableView.delegate = self;
    _rightTableView.dataSource = self;
    _rightTableView.delegate = self;
//    _leftTableView.backgroundColor = [UIColor redColor];
//    _middelTableView.backgroundColor = [UIColor grayColor];
//    _rightTableView.backgroundColor = [UIColor greenColor];
    _leftTableView.showsVerticalScrollIndicator = NO;
    _middelTableView.showsVerticalScrollIndicator = NO;
    
}
-(void)createData
{
    NSArray * arr1 = @[@"category_All.jpg",@"category_Book.jpg",@"category_Business.jpg",@"category_Catalogs.jpg",@"category_Education.jpg",@"category_Pastime.jpg",@"category_Finance.jpg",@"category_FoodDrink.jpg",@"category_Game.jpg",@"category_Health.jpg",@"category_Life.jpg",@"category_Medical.jpg",@"category_Music.jpg",@"category_Gps.jpg",@"category_News.jpg",@"category_Photography.jpg",@"category_Ability.jpg",@"category_Refer.jpg",@"category_Social.jpg",@"category_Sports.jpg",@"category_Travel.jpg",@"category_Tool.jpg",@"category_Weather.jpg"];
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
    NSLog(@"%d",_rightArrayData.count);
}
#pragma mark - uitableview协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"d");
    if (tableView==_leftTableView) {
        return _leftArrayData.count;
    }
    else if(tableView==_middelTableView)
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
//    cell.textLabel.text = @"d";
    UIImageView * imageView = (UIImageView *)[cell.contentView viewWithTag:1234];
    if (tableView==_leftTableView) {
        DataItem * item = _leftArrayData[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 110, 156);
//        NSLog(@"_leftTableView%@",NSStringFromCGRect(cell.bounds));
    }
    else if(tableView==_middelTableView)
    {
        DataItem * item = _middleArrayData[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 110, 236);
//         NSLog(@"_middelTableView%@",NSStringFromCGRect(cell.frame));
    }
    else
    {
        DataItem * item = _rightArrayData[indexPath.row];
        imageView.image = item.image;
        imageView.frame = CGRectMake(4, 4, 100, 116);
//         NSLog(@"_rightTableView%@",NSStringFromCGRect(cell.bounds));
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_leftTableView) {
        DataItem * item = _leftArrayData.lastObject;
        
        return item.rowHeight;
    }
    else if (tableView==_middelTableView)
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
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray * arr = @[_leftTableView,_middelTableView,_rightTableView];
    for (UIScrollView * s in arr) {
        if (s!=scrollView) {
            s.contentOffset = scrollView.contentOffset;
        }
    }
}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    NSLog(@"ddd");
//    return 1;
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
