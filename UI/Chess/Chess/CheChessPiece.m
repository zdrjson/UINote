//
//  CheChessPiece.m
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "CheChessPiece.h"

@implementation CheChessPiece
-(id)initWithWidth:(float)w WithHeight:(float)h
{
    self = [super initWithWidth:w WithHeight:h];
    if (self) {
        UIImage * img = [UIImage imageNamed:@"blackche.jpg"];
        self.image = img;
    }
    return self;
}
-(BOOL)canGo:(CGPoint)newp
{
    if (_row==newp.x || _column==newp.y) {
        return YES;
    }
    return NO;
}
@end
