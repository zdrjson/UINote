//
//  CellModel.h
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define __string(__k__)  @property(nonatomic,retain) NSString * __k__

@interface CellModel : NSObject
__string(Name);
__string(Publisher);
__string(NumRatings);
@property (nonatomic,assign)float Rating;
__string(Price);
__string(Icon);

@end

