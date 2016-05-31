//
//  ShuaiChessPiece.m
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ShuaiChessPiece.h"

@implementation ShuaiChessPiece
-(id)initWithWidth:(float)w WithHeight:(float)h
{
    self = [super initWithWidth:w WithHeight:h];
    if (self) {
        _subType = CHESS_SUBTYPE_RED;
        UIImage * img = nil;
        img = [UIImage imageNamed:@"redjiang.jpg"];
        self.image = img;
    }
    return self;
}
-(BOOL)canGo:(CGPoint)newp
{
    return YES;
}
@end
