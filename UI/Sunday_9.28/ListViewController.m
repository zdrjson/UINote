//
//  ListViewController.m
//  Sunday_9.28
//
//  Created by qianfeng on 14-9-28.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ListViewController.h"
#import "AppModel.h"
#import "AppCell.h"
@implementation VCTypeObject

-(NSString *)getTitle
{
    return @[@"限免",@"降价",@"免费",@"专题",@"热榜"][_type];
}

-(NSString *)getURL
{
    NSString * strFormat = @[@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d",
                             @"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%d",
                             @"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%d",
                             @"",
                             @"http://open.candou.com/mobile/hot/page/%d"][_type];
    return [NSString stringWithFormat:strFormat,_page];
}

@end



@interface ListViewController ()
{
    VCTypeObject * _vcTypeObject;
    UITableView * _tableView;
    NSMutableArray * _dataArray;
    NSMutableData * _data;
}
@end

@implementation ListViewController

- (instancetype)initWithType:(int)type
{
    self = [super init];
    if (self) {
        _Type = type;
        NSLog(@"%d",type);
    }
    return self;
}

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
    
    [self prepareData];
    
    [self uiConfig];
}
-(void)prepareData
{
    _vcTypeObject = [[VCTypeObject alloc] init];
    _vcTypeObject.type = _Type;
    _vcTypeObject.page = 1;
    
    _dataArray = [[NSMutableArray alloc] init];
    _data = [[NSMutableData alloc] init];
    
    [self loadData];
    NSLog(@"%d",_Type);
}
-(void)loadData
{
     NSString * url = [_vcTypeObject getURL];
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
}
-(void)uiConfig
{
    self.title = [_vcTypeObject getTitle];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}
-(void)loadNextPage
{
    _vcTypeObject.page++;
    [self loadData];
    
}
#pragma mark --UITableView--
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == _dataArray.count) {
        [self loadNextPage];
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _dataArray.count) {
        static NSString * cellid = @"cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        cell.textLabel.text = @"点击加载更多";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
    static NSString * cellid = @"cellid";
    AppCell *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AppCell" owner:self options:nil] firstObject];
    }
    cell.appModel = _dataArray[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count==0?_dataArray.count:_dataArray.count+1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == _dataArray.count?44:100;
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
    [_dataArray addObjectsFromArray:[AppModel parsingWithJsonData:_data]];
    [_tableView reloadData];
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
