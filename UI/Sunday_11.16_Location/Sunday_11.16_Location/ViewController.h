//
//  ViewController.h
//  Sunday_11.16_Location
//
//  Created by qianfeng on 14-11-16.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController
{
    CLLocationManager * _gspManager;
    CLGeocoder * _coder;
}
@end
