//
//  AppCell.h
//  Sunday_9.28
//
//  Created by qianfeng on 14-9-28.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"
@interface AppCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView * iconImage;
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UILabel * descLabel;

@property (nonatomic,retain)AppModel * appModel;
@end
