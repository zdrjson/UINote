//
//  ADViewCell.h
//  Friday_10.3
//
//  Created by qianfeng on 14-10-5.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADModel.h"
@interface ADViewCell : UITableViewCell <UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    
    UILabel * _labelTitle;
    
    UIPageControl * _pageController;
    
    NSArray *_aDArray;
}
@property (nonatomic,retain) ADModel * aDModel;
-(void)loadAdDataModel:(NSMutableArray *)aDArray;
@end
