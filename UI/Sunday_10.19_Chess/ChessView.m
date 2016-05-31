//
//  ChessView.m
//  Sunday_10.19_Chess
//
//  Created by qianfeng on 14-10-20.
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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        UIImageView * iv = [[UIImageView alloc] initWithFrame:self.bounds];
        iv.image = [UIImage imageNamed:@"象棋棋盘.jpg"];
        [self addSubview:iv];
        [self createBackground];
        [self putChessPieces];

    }
    return self;
}
-(void)putChessPieces
{
    JiangChessPiece * jiang = [[JiangChessPiece alloc] init];
    [self addSubview:jiang];
    
    ShuaiChessPiece * shuai = [[ShuaiChessPiece alloc] init];
    [self addSubview:shuai];
    
    CheChessPiece * che1 = [[CheChessPiece alloc] init];
    [self addSubview:che1];
    
    CheChessPiece * che2 = [[CheChessPiece alloc] init];
    [self addSubview:che2];
    
    JuChessPiece * ju1 = [[JuChessPiece alloc] init];
    [self addSubview:ju1];
    
    JuChessPiece * ju2 = [[JuChessPiece alloc] init];
    [self addSubview:ju2];
    
}
-(void)createBackground
{
#define CHESS_ROWS 10
#define CHESS_COLUMNS 9
    _chessWidth = self.frame.size.width/(CHESS_COLUMNS-1);
    _chessHeight = self.frame.size.height/(CHESS_ROWS-1);
    
    for (int row = 0; row<CHESS_ROWS; row++) {
        for (int column = 0; column<CHESS_COLUMNS; column++) {
            //            UIButton * b = [UIButton buttonWithType:UIButtonTypeSystem];
            //            UIButton * b = [UIButton buttonWithType:UIButtonTypeCustom];
            MyButton * b = [[MyButton alloc] init];
            b.frame = CGRectMake((column * _chessWidth) - ( _chessWidth/2), (row * _chessHeight)- (_chessHeight/2), _chessWidth, _chessHeight);
            b.row = row;
            b.column = column;
            [b setTitle:[NSString stringWithFormat:@"%d,%d",row,column] forState:UIControlStateNormal];
            [b addTarget:self action:@selector(chessClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:b];
        }
    }
}
-(void)chessClick:(MyButton *)btn
{
//    NSLog(@"%d%d",btn.row,btn.column);
    
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
