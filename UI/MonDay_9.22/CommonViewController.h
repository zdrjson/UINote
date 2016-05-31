//
//  CommonViewController.h
//  MonDay_9.22
//
//  Created by qianfeng on 14-9-22.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonViewController : UIViewController
{
    UITableView * _tableView;
    
    NSMutableArray * _arrayData;
    
}
//创建分栏元素项
-(void)createTabBarItemWithTitle:(NSString *)title Image:(UIImage *)image SelectedImage:(UIImage *)selectedimage;
//设置导航控制器的标题
-(void)setTitle:(NSString *)title;
//设置导航栏的左导航元素项
-(void)createLeftBarButtonItemWithTitle:(NSString *)tilte ItemStyle:(UIBarButtonItemStyle)itemStyle Target:(id)target  action:(SEL)sel;
//设置导航栏的右导航元素项
-(void)createRightBarButtonItemWithTitle:(NSString *)tilte ItemStyle:(UIBarButtonItemStyle)itemStyle Target:(id)target action:(SEL)sel;
@end
