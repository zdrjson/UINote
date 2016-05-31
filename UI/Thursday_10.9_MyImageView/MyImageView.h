//
//  MyImageView.h
//  Thursday_10.9_MyImageView
//
//  Created by qianfeng on 14-10-9.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImageView : UIImageView
{
    id _target;
    SEL _selector;
    
    id _dTargt;
    SEL _dSelector;
}
-(void)addSingleTarget:(id)target action:(SEL)selector;
-(void)addDoubleTarget:(id)target action:(SEL)selctor;
@end
