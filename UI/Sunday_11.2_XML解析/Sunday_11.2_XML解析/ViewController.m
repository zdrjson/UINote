//
//  ViewController.m
//  Sunday_11.2_XML解析
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "BookModel.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
}
@end

@implementation ViewController

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
    // Do any additional setup after loading the view from its nib.
    [self prepareData];
    [self uiConfig];
//    [self xPath];
    [self xPath2];
    
}
-(void)xPath2
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"sns" ofType:@"txt"];
    NSData * data = [NSData dataWithContentsOfFile:path];
    GDataXMLDocument * document = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    NSArray * arr = [document nodesForXPath:@"//realname" error:nil];
    for (GDataXMLElement * user in arr) {
        NSLog(@"%@",[user stringValue]);
    }
}
//xPath是用来对xml进行查找的语言
-(void)xPath
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"sns" ofType:@"txt"];
    NSData * data = [NSData dataWithContentsOfFile:path];
    GDataXMLDocument * docuement = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    NSArray * arr = [docuement nodesForXPath:@"/root/user_list/user" error:nil];
    for (GDataXMLElement * user in arr) {
        NSLog(@"%@",[[user elementsForName:@"realname"][0] stringValue]);
    }
    
}
-(void)prepareData
{
    _dataArray = [NSMutableArray array];
    //解析xml
    NSString * path = [[NSBundle mainBundle] pathForResource:@"xml" ofType:@"txt"];
    NSString * xmlStr = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:path] encoding:NSUTF8StringEncoding error:nil];
    
    //创建一个xml数据的容器
    //xml文件的内容已经导入到程序中，并且已经是可以取得对应字段的有格式的数据
    GDataXMLDocument * document = [[GDataXMLDocument alloc] initWithXMLString:xmlStr options:0 error:nil];
    //找到根节点
    GDataXMLElement * root = [document rootElement];
    //stringValue 过滤掉所有的标签
    //XMLString带标签的内容
//    NSLog(@"%@",root.stringValue);
    NSArray * booksArr = [root elementsForName:@"books"];
//    NSLog(@"%@",booksArr);
    GDataXMLElement * books = booksArr[0];//根节点下面有books节点里面有一个，所有有一个元素
//    NSLog(@"%@",books.XMLString);
    NSArray * bookArr = [books elementsForName:@"book"];
//    NSLog(@"%d",bookArr.count);
    for (GDataXMLElement * book in bookArr) {
        for (GDataXMLNode * node in book.attributes) {//attributes属性
//            NSLog(@"%@",node.stringValue);//这里打印节点的值//node 节点
//            NSLog(@"%@",node.name);//这里打印节点的名字
        }
        BookModel * model = [[BookModel alloc] init];
        model.bookName = [[book elementsForName:@"name"][0] stringValue];
        model.bookPrice = [[book elementsForName:@"price"][0] stringValue];
        model.bookSummary = [[book elementsForName:@"summary"][0] stringValue];
        model.autherName = [[[book elementsForName:@"auther"][0] elementsForName:@"name"][0] stringValue];
        [_dataArray addObject:model];
    }
}
-(void)uiConfig
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

}
#pragma mark --UITableView协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    BookModel * model = _dataArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@(%@ %@)",model.bookName,model.autherName,model.bookPrice];
    cell.detailTextLabel.text = model.bookSummary;
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
