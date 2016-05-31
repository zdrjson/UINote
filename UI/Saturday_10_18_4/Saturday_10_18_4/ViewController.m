//
//  ViewController.m
//  Saturday_10_18_4
//
//  Created by qianfeng on 14-10-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self preparData];
    [self uiConfig];
}
-(void)preparData
{
    _dataArray = [NSMutableArray array];
    for (int i = 'A'; i<'Z'+1; i++) {
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        [dict setObject:[NSString stringWithFormat:@"%c组",i] forKey:GROUP_NAME];
        [dict setObject:[NSNumber numberWithBool:YES] forKey:GROUP_STATE];
        NSMutableArray * subArray = [NSMutableArray array];
        for (int j = 0; j<5; j++) {
            [subArray addObject:[NSString stringWithFormat:@"%c%d",i,j]];
            
        }
        [dict setObject:subArray forKey:GROUP_CONTENT];
        [_dataArray addObject:dict];
    }
//    NSLog(@"%@",_dataArray);
}
-(void)uiConfig
{
    _tabelView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    [self.view addSubview:_tabelView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_dataArray[section][GROUP_STATE] boolValue])
    {
        return 0;
    }
    else
    {
        return [_dataArray[section][GROUP_CONTENT] count];
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:[NSString stringWithFormat:@"第%d组",section] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 270);
    button.frame = CGRectMake(0, 0, 320, 30);
    button.tag = section+100;
    if (section%2==0) {
        button.backgroundColor = [UIColor greenColor];
    }
    else
    {
        button.backgroundColor = [UIColor blueColor];
    }
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;

}
-(void)btnClick:(UIButton *)btn
{
    if ([_dataArray[btn.tag-100][GROUP_STATE] boolValue]) {
        [_dataArray[btn.tag-100] setObject:[NSNumber numberWithBool:NO] forKey:GROUP_STATE];
    }
    else
    {
        [_dataArray[btn.tag-100] setObject:[NSNumber numberWithBool:YES] forKey:GROUP_STATE];
    }
    [_tabelView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag-100] withRowAnimation:UITableViewRowAnimationFade];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"cellid";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = _dataArray[indexPath.section][GROUP_CONTENT][indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
