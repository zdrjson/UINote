//
//  ChinessPiece.h
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CHESS_TYPE_CHE 1
#define CHESS_TYPE_MA 2
#define CHESS_TYPE_XIANG 3
#define CHESS_TYPE_JIANG 4

#define CHESS_SUBTYPE_RED 1
#define CHESS_SUBTYPE_BLACK 1
@interface ChessPiece : UIImageView
{
    float _chessWidth;
    float _chessHeight;
    
    int _row;
    int _column;
    
    int _type;
    int _subType;
}
@property (nonatomic,assign) int row;
@property (nonatomic,assign) int column;
//这个函数可以给棋子设置在棋盘上的任意位置
-(void)setPosition:(CGPoint)p;
-(id)initWithWidth:(float)w WithHeight:(float)h;
//判断棋子是否可以走到newP
//抽象方法 这个方法没有实现
//抽象类 这个类中有一部分函数没有实现
-(BOOL)canGo:(CGPoint)newp;
//当前子能否吃掉newChess
-(BOOL)canEat:(ChessPiece *)newChess;
-(void)gainFocus;
-(void)lostFocus;
@end
