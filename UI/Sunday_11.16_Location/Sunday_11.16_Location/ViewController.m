//
//  ViewController.m
//  Sunday_11.16_Location
//
//  Created by qianfeng on 14-11-16.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"
#import "HttpRequestManager.h"
@interface ViewController ()<CLLocationManagerDelegate>
{
    NSString * _s;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton * startLocationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    startLocationButton.frame = CGRectMake(50, 50, 100, 40);
    [startLocationButton setTitle:@"开始定位" forState:UIControlStateNormal];
    [startLocationButton addTarget:self action:@selector(startLocation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startLocationButton];
    //创建一个 CLLocationManger
    _gspManager = [[CLLocationManager alloc] init];
    //locationServicesEnabled判断是否你得设备有GPS硬件
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"你得设备没有GPS硬件");
    }
    //主要用在导航的精度上 普通用kCLLocationAccuracyBest
    _gspManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
   
    //设置一个接受GPS信号代理函数
    _gspManager.delegate = self;
}
-(void)startLocation:(UIButton *)btn
{
    //打开定位服务
    //开始定位
    [_gspManager startUpdatingLocation];
}
-(NSString *)getBaiduAddress:(CLLocation *)location
{
    //通过baidu取得这个位置的经纬度
    double latitude = location.coordinate.latitude;
    double longtitude = location.coordinate.longitude;
    NSString * urlStr = [NSString stringWithFormat:@"http://api.map.baidu.com/geocoder?output=json&location=%f,%f&key=dc40f705157725fc98f1fee6a156e60",latitude,longtitude];
    [HttpRequestManager GET:urlStr complete:^(NSData * data) {
        _s = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@",_s);
    } failed:^{
        
    }];
    
    return _s;
}
//Apple自带的地址反编码
-(NSString *)getAppleAddress:(CLLocation *)location
{
    NSLog(@"%@",location);
    //CLGeocoder 系统自带的 地理 编码和反编码
    _coder = [[CLGeocoder alloc] init];
    //reverseGeocodeLocation启动一个地址反编码
//    这个函数会向Apple服务器发送请求然后取得地址信息
    [_coder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        //地址反编码完成调用函数
        for (CLPlacemark * place in placemarks) {
            NSLog(@"place is %@",place);
        }
        NSLog(@"%d",placemarks.count);
    }];
    return nil;
}
/*
 CLLocation是iOS表示位置的一个数据结构...里面包含经度纬度 速度
*/
-(void)doLocation:(CLLocation *)newLocation
{
    double latitude = newLocation.coordinate.latitude;
    double longtitude = newLocation.coordinate.longitude;
    double speed = newLocation.speed;//速度
    double altitude = newLocation.altitude;//海拔
    NSDate * timer = newLocation.timestamp; //当前获取gps数据的时间
//    NSLog(@"new location is %@",newLocation);
    
    NSString * baiduAddr= [self getBaiduAddress:newLocation];
//    NSLog(@"baidu addr is %@",baiduAddr);
    NSString * appleAddr = [self getAppleAddress:newLocation];
    
}
//地址反编码（用的更多）：把具体的经纬度转成具体的信息
//当有一个新的位置数据的时候，本函数会得到调用，oldLaction可能为nil（第一次调用的情况）newLocation
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    
}
//当有一个新的位置数据的时候，本函数会被调用6.0之后 locations是一组位置数据（通常情况下是一组数据）
- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    for (CLLocation * oneLocation in locations) {
//        NSLog(@"location is %@",oneLocation);
        [self doLocation:oneLocation];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
