//
//  ViewController.m
//  AFNetWorking
//
//  Created by qianfeng on 14-11-7.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString * url =@"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1";
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc] init];
    //默认使用json解析
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //使用xml解析
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    //不解析，返回的是NSData
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    GET 请求
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    //POST 请求
    NSString * urlStr = @"http://192.168.88.171/1409/chat/login.php";
    [manager POST:urlStr parameters:@{@"username": @"453",@"password":@"453"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",str);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    //上传图片
    NSString * postImage = @"http://121.41.34.197/chat/message/uploadTopic.php";
    
    //上传完图片后,可以通过这个地址查看图片
    //http://121.41.34.197/chat/message/image/14153522810.jpg
    
    //获取数据
    //http://121.41.34.197/chat/message/getTopic.php?eNum=100&sNum=0
    
    //上传文件
    //1.url
    //2.参数字典
    //3.bolck用于正向传值
    //4.成功
    //5.失败
    [manager POST:postImage parameters:@{@"UID":@"999",
                                         @"TEXT":@"999",
                                         @"TITLE":@"999",
                                         @"UNAME":@"999",
                                         @"cateID":@"999"
                                         } constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        UIImage * img = [UIImage imageNamed:@"test@2x"];
        NSData * data = UIImagePNGRepresentation(img);
              //  data = UIImageJPEGRepresentation(img, 1.0);
        [formData appendPartWithFileData:data  //NSData
                                    name:@"file"    //对应的接口中的变量名
                                fileName:@"cheche.png"//文件名
                                mimeType:@"png"]; //文件类型
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

@end
