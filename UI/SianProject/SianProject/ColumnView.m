//
//  ColumnView.m
//  SianProject
//
//  Created by qianfeng on 14-10-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ColumnView.h"
#import "Common.h"
#import "QFLabel.h"
@implementation ColumnView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setDelegate:(id<columnViewProtocol>)delegate
{
    _delegate= delegate;
    [self makeView];
}
#define kXItemPad 5
#define kItemFont 15
-(void)makeView
{
//    QFLog(@"enter function %@",NSStringFromSelector(_cmd));
    int numOfItems = [_delegate numberOfColumnView:self];
    float x = kXItemPad;
    float width = 50;
    float height = self.bounds.size.height;
    for (int i = 0; i<numOfItems; i++) {
        NSString * s = [_delegate columnView:self atIndex:i];
        CGRect rect = CGRectMake(x+(width+kXItemPad)*i, 0, width, height);
        QFLabel * label = [[QFLabel alloc] initWithFrame:rect];
//        label.font = [UIFont systemFontOfSize:kItemFont];
        label.adjustsFontSizeToFitWidth = YES;
        label.text = s;
        label.tag = i;
        [label setNormalColor:[UIColor blackColor]];
        [label setHighlightColor:[UIColor redColor]];
        [label addClickEvent:self selector:@selector(clickMe:)];
        [self addSubview:label];
//        x+=width+kXItemPad;
        
    }
    
}
-(void)clickMe:(QFLabel *)label
{
    if ([_delegate respondsToSelector:@selector(columnView:didSelectedAtIndex:)]) {
        [_delegate columnView:self didSelectedAtIndex:label.tag];
    }
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
