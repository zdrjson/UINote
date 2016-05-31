//
//  RootViewController.h
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
{
    //存放原始的中文数据
    NSMutableArray * _arrayChinese;
    //存放好分类好的中文数据，key为首字母，value为数组
    NSMutableDictionary * _dictPinyinAndChinese;
    //存放字典中的key ,已经按字母顺序排序号
    NSMutableArray * _arrayChar;
}
@end
