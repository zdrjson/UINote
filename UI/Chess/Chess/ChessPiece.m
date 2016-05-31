//
//  ChinessPiece.m
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ChessPiece.h"

@implementation ChessPiece
-(id)init
{    CGRect frame = CGRectMake(0, 0, 30, 30);
    self = [super initWithFrame:frame];
    if (self) {
        UIImage * img = [UIImage imageNamed:@"blackjiang.jpg"];
        self.image = img;
    }
    return self;
}
-(id)initWithWidth:(float)w WithHeight:(float)h
{    CGRect frame = CGRectMake(0, 0, 30, 30);
    self = [super initWithFrame:frame];
    if (self) {
        UIImage * img = [UIImage imageNamed:@"blackjiang.jpg"];
        self.image = img;
        _chessWidth = w;
        _chessHeight = h;
    }
    return self;
}
-(void)setPosition:(CGPoint)p
{
    //希望写一个函数 p就是人可以识别 的row column
    //    newPoint 主要是uiview需要的
    CGPoint newPoint = [self convertToCenter:p];
    self.center = newPoint;
    _row = p.x;
    _column = p.y;
}
-(CGPoint)convertToCenter:(CGPoint)p
{
    CGPoint newP;
    int row = p.x;
    int column = p.y;
    newP.x = column * _chessWidth;
    newP.y = row * _chessHeight;
    return newP;
}
-(BOOL)canGo:(CGPoint)newp
{
    return NO;
}
-(void)gainFocus
{
    //让uiview放大1.2倍
    self.transform = CGAffineTransformMakeScale(1.2, 1.2);
}
-(void)lostFocus
{
    self.transform = CGAffineTransformMakeScale(1, 1);
}
-(BOOL)canEat:(ChessPiece *)newChess
{
    return NO;
}
@end
