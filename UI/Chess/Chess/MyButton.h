//
//  MyButton.h
//  Chess
//
//  Created by qianfeng on 14-10-19.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>
struct test{//基类
    int a;
    int b;
};
struct test2{
    struct test abc;
};
struct test3{
    struct test2 aaaaa;
};
//面向对象是一种思想 什么语言都面向对象
//继承 现有的不够好 所以要继承
@interface MyButton : UIButton
{
    int _row;
    int _column;
}
@property (nonatomic,assign)int row;
@property (nonatomic,assign)int column;
@end
