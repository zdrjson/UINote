//
//  ViewController.m
//  Thuesday_11.4_CollctionView
//
//  Created by qianfeng on 14-11-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "MyLayout.h"
#import "MyCell.h"
#import "HttpRequestManager.h"
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
    [self prepareData];
    [self uiConfig];
}
-(void)prepareData
{
    _dataArray = [[NSMutableArray alloc] init];
    [HttpRequestManager GET:@"http://i.snssdk.com/gallery/1/top/?tag=ppmm&offset=1&count=30" complete:^(NSData * data) {
        _dataArray= [ImageModel parsingJsonData:data];
        _layout.dataArray = _dataArray;
        [_collectionView reloadData];
    } failed:^{
        
    }];
    
}
-(void)uiConfig
{
    _layout = [[MyLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"cellId"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
}
#pragma mark --UICollctionView协议方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    [cell fillData:_dataArray[indexPath.row]];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
