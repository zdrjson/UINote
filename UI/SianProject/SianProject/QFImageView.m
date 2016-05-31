//
//  QFImageView.m
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "QFImageView.h"

@implementation QFImageView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
