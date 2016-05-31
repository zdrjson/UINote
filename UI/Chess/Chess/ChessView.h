//
//  ChessView.h
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ChessPiece;
@interface ChessView : UIView
{
    float _chessWidth;
    float _chessHeight;
    //所有棋子数组
    NSMutableArray * _allChessArray;
    ChessPiece * _selectedChessPiece;
}
@end
