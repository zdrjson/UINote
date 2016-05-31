//
//  JuChessPiece.m
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "JuChessPiece.h"

@implementation JuChessPiece
-(id)initWithWidth:(float)w WithHeight:(float)h
{
    self = [super initWithWidth:w WithHeight:h];
    if (self) {
        UIImage * img = [UIImage imageNamed:@"redche1.jpg"];
        self.image = img;
    }
    return self;
}
//-(BOOL)canGo:(CGPoint)newp
//{
//    return YES;
//}
@end
