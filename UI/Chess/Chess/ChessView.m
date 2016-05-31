//
//  ChessView.m
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ChessView.h"
#import "MyButton.h"
#import "ChessPiece.h"
#import "JiangChessPiece.h"
#import "ShuaiChessPiece.h"
#import "CheChessPiece.h"
#import "JuChessPiece.h"
@implementation ChessView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        CGRect rect2 = self.bounds;
        UIImageView * iv = [[UIImageView alloc] initWithFrame:rect2];
        UIImage * img = [UIImage imageNamed:@"象棋棋盘1.jpg"];
        iv.image = img;
        [self addSubview:iv];
        [self createBackground];
        [self putChessPieces];
    }
    return self;
}
-(void)putChessPieces
{   _allChessArray = [NSMutableArray array];
    JiangChessPiece * jiang = [[JiangChessPiece alloc] initWithWidth:_chessWidth WithHeight:_chessHeight];
    [jiang setPosition:CGPointMake(0, 4)];
    [self addSubview:jiang];
    
    ShuaiChessPiece * shuai = [[ShuaiChessPiece alloc] initWithWidth:_chessWidth WithHeight:_chessHeight];
    [shuai setPosition:CGPointMake(9, 4)];
    [self addSubview:shuai];
    
    CheChessPiece * che1 = [[CheChessPiece alloc] initWithWidth:_chessWidth WithHeight:_chessHeight];
    [che1 setPosition:CGPointMake(0, 0)];
    [self addSubview:che1];
    
    CheChessPiece * che2 = [[CheChessPiece alloc] initWithWidth:_chessWidth WithHeight:_chessHeight];
    [che2 setPosition:CGPointMake(0, 8)];
    [self addSubview:che2];
    
    JuChessPiece * ju1 = [[JuChessPiece alloc] initWithWidth:_chessWidth WithHeight:_chessHeight];
    [ju1 setPosition:CGPointMake(9, 0)];
    [self addSubview:ju1];
    JuChessPiece * ju2 = [[JuChessPiece alloc] initWithWidth:_chessWidth WithHeight:_chessHeight];
    [ju2 setPosition:CGPointMake(9, 8)];
    [self addSubview:ju2];
    
    [_allChessArray addObject:jiang];
    [_allChessArray addObject:shuai];
    [_allChessArray addObject:che1];
    [_allChessArray addObject:che2];
    [_allChessArray addObject:ju1];
    [_allChessArray addObject:ju2];
}
-(void)putChessPieces2
{
    int row = 9;
    int column = 4;
//    [self putOneChessWithRow:row withColumn:column];
    CGPoint p = CGPointMake(row, column);
    [self putOneChessAtPoint:p];
    row = 1;
    column = 2;
    [self putOneChessAtPoint:CGPointMake(row, column)];
}
-(void)putOneChessAtPoint:(CGPoint)p
{
    
    //如何让row ，column 转化成self上的点
//    CGRect rect = CGRectMake(0, 0, 30, 30);
//    ChessPiece * iv = [[ChessPiece alloc] initWithFrame:rect];
    ChessPiece * iv = [[ChessPiece alloc] initWithWidth:_chessWidth WithHeight:_chessHeight];
    [iv setPosition:p];
    [self addSubview:iv];
}
-(void)createBackground
{
//    放可以点击的按钮 10，9
#define CHESS_ROWS 10
#define CHESS_COLUMNS 9
    CGSize size = self.frame.size;
    _chessWidth = size.width/(CHESS_COLUMNS-1);
    _chessHeight = size.height/(CHESS_ROWS-1);
    float xOffset = -_chessWidth/2;
    float yOffset = -_chessHeight/2;
    for (int row = 0; row<CHESS_ROWS; row++) {
        for (int column = 0; column < CHESS_COLUMNS; column++) {
            float x = xOffset + column *_chessWidth;
            float y = yOffset + row * _chessHeight;
            CGRect r = CGRectMake(x, y, _chessWidth, _chessHeight);
            //            UIButton * b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            //            UIButton * b = [UIButton buttonWithType:UIButtonTypeCustom];
            MyButton * b = [[MyButton alloc] init];//创建透明的按钮
            NSString * t = [NSString stringWithFormat:@"%d,%d",row,column];
            //            b.tag = row * 100 + column;
            //            b.tag = row <<8 |column;
            b.row = row;
            b.column = column;
            [b setTitle:t forState:UIControlStateNormal];
            [b addTarget:self action:@selector(chessClick:) forControlEvents:UIControlEventTouchUpInside];
            b.frame = r;
            [self addSubview:b];
            if (row==0&&column==0) {
                b.backgroundColor = [UIColor blueColor];
            }
            
        }
    }
}
-(void)chessClick:(MyButton *)btn
{
    //    int row = (btn.tag)>>8&0xFF;
    //    int column = (btn.tag)&0xFF;
    int row = btn.row;
    int column = btn.column;
    NSLog(@"%d%d",row,column);
    CheChessPiece * newCp = nil;
    for (ChessPiece * cp in _allChessArray) {
        if (cp.row==row && cp.column == column) {
            //选中的棋子 cp
            if (_selectedChessPiece) {
                if (_selectedChessPiece==newCp) {
                    
                }
            }
            _selectedChessPiece = cp;
            //让棋子_selectedChessPiece获得焦点
            [_selectedChessPiece gainFocus];
            return;
            
        }
    }
    //走到这个地方来 选中的是棋盘
    if (_selectedChessPiece) {
        if ([_selectedChessPiece canGo:CGPointMake(row, column)]) {
             [_selectedChessPiece setPosition:CGPointMake(row, column)];
        }
       
        _selectedChessPiece = nil;
    }
}
@end
