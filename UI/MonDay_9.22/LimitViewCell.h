//
//  LimitViewCell.h
//  MonDay_9.22
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebImageView.h"
#import "RatingView.h"
@interface LimitViewCell : UITableViewCell
{
    UILabel * _appName;
    
    UILabel * _appLastPrice;
    
    UILabel * _appLimitTime;
    
    UILabel * _appType;
    
    UILabel * _appShareCnt;
    
    UILabel * _appStoreCnt;
    
    UILabel * _appDownCnt;
    
    WebImageView * _appIcon;
    
    RatingView * _appStarsView;
    
}
@end
