//
//  ViewController.m
//  Saturday_11.15_瀑布流
//
//  Created by qianfeng on 14-11-15.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "MyLayout.h"
#import "MyCell.h"
#import "AFNetworking.h"
#import "ImageModel.h"
@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView * _collectionView;
    NSMutableArray * _dataArray;
    MyLayout * _layout;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _layout = [[MyLayout alloc] init];
    [self prepareData];
    [self uiConfig];
    
}
-(void)prepareData
{
    _dataArray = [NSMutableArray array];
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc] init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://i.snssdk.com/gallery/1/top/?tag=ppmm&offset=1&count=30" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        _dataArray = [ImageModel parsingJsonData:responseObject];
        _layout.dataArray =_dataArray;
        [_collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
   
}
-(void)uiConfig
{
    
    _collectionView= [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"cellid"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    [cell fillData:_dataArray[indexPath.row]];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
