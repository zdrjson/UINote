//
//  ViewController.m
//  CollectionView
//
//  Created by qianfeng on 14-11-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "MyLayout.h"
#import "MyCell.h"
#import "ImageModel.h"
@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    UICollectionView * _collectionView;
    NSMutableArray * _dataArray;
    NSMutableData * _data;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _dataArray = [[NSMutableArray alloc] init];
    _data = [[NSMutableData alloc] init];
//    for (int i = 0; i<20 ;i++) {
//        ImageModel * model = [[ImageModel alloc] init];
//        model.cellHeight = arc4random()%300+50;
//        [_dataArray addObject:model];
//    }
    
    MyLayout * layout = [[MyLayout alloc] init];
    layout.dataArray = _dataArray;
    
    //layout决定了cllectionView所有cell的布局
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //在需要的时候，调用这个类，创建cell
    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"cellid"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [self loadData];
}
-(void)loadData
{
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://i.snssdk.com/gallery/1/top/?tag=ppmm&offset=1&count=30"]] delegate:self];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    id res = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dic = (NSDictionary *)res;
    NSArray * arr = dic[@"data"];
    for ( int i = 0; i<arr.count; i++) {
        NSDictionary * d = arr[i];
        ImageModel * model = [[ImageModel alloc] init];
        model.imgUrl = d[@"thumbnail_url"];
        model.imgHeight = [d[@"image_height"] doubleValue];
        model.imgWidth = [d[@"image_width"] doubleValue];
        [_dataArray addObject:model];
    }
    //用多线程计算行高
    dispatch_apply(_dataArray.count , dispatch_get_global_queue(0, 0), ^(size_t n) {
        ImageModel * model = _dataArray[n];
        model.cellHeight = model.imgHeight/model.imgWidth * 150+10;
    });
    [_collectionView reloadData];
   
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  _dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    [cell fillData:_dataArray[indexPath.row]];
    return cell;
}


@end
