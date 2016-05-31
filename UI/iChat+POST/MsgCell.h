//
//  MsgCell.h
//  iChat
//
//  Created by qianfeng on 14-10-31.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgModel.h"
@interface MsgCell : UITableViewCell
@property (nonatomic,strong)MsgModel * model;
-(void)fillData;
+(void)calcHeight:(MsgModel *)model;
@end
