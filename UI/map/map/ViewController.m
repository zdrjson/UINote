//
//  ViewController.m
//  map
//
//  Created by qianfeng on 14-11-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager * _location;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始定位" style:UIBarButtonItemStylePlain target:self action:@selector(startLocation)];
    _location = [[CLLocationManager alloc] init];
    _location.delegate = self;
    
}
-(void)startLocation
{
    if ([CLLocationManager locationServicesEnabled]) {
        _location.desiredAccuracy = kCLLocationAccuracyBest;
        [_location startUpdatingLocation];
    }
}
//获取定位值
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}

@end
