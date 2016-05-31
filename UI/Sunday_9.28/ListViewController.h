//
//  ListViewController.h
//  Sunday_9.28
//
//  Created by qianfeng on 14-9-28.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCTypeObject : NSObject

@property (nonatomic,assign) int type;
@property (nonatomic,assign) int page;

-(NSString *)getTitle;
-(NSString *)getURL;

@end

@interface ListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>

@property (nonatomic,assign) int Type;

-(id)initWithType:(int)type;

@end
