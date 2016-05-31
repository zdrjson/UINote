//
//  ColumnView.h
//  SianProject
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ColumnView;
@protocol columnViewProtocol <NSObject>

-(NSInteger)numberOfColumnView:(ColumnView *)columnView;

-(NSString *)columnView:(ColumnView *)columnView atIndex:(NSInteger)index;

-(void)columnView:(ColumnView *)columnView didSelectedAtIndex:(NSInteger)index;

@end

@interface ColumnView : UIView

@property (nonatomic,retain) id<columnViewProtocol>delegate;

@end
