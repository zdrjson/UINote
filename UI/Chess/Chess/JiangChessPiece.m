//
//  JiangChessPiece.m
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "JiangChessPiece.h"

@implementation JiangChessPiece
-(id)initWithWidth:(float)w WithHeight:(float)h
{
    self = [super initWithWidth:w WithHeight:h];
    if (self) {
        _type = CHESS_TYPE_JIANG;
        _subType = CHESS_SUBTYPE_BLACK;
        UIImage * img = nil;
            img = [UIImage imageNamed:@"blackjiang.jpg"];
            self.image = img;
    }
    return self;
}
-(BOOL)canGo:(CGPoint)newp
{
    return NO;
}
@end
