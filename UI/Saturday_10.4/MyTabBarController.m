//
//  MyTabBarController.m
//  Saturday_10.4
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyTabBarController.h"
#import "ListViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createSubViewControllers];
    
}
-(void)createSubViewControllers
{
    NSMutableArray * vcs = [[NSMutableArray alloc] init];
    for (int i = 0; i<6; i++) {
        UIViewController * vc = [[ListViewController alloc] initWithType:i];
        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcs addObject:navi];
//        NSLog(@"%d",navi.tabBarItem.tag);
    }
    NSUserDefaults  * def = [NSUserDefaults standardUserDefaults];
    NSArray * tempArray = [def objectForKey:@"KEY_ARRAY"];
    NSMutableArray *mutArray = [NSMutableArray array];
//    NSLog(@"%@",tempArray);
    if (tempArray) {
#if 0
        for (UINavigationController * navCtrl in vcs) {
            for (NSNumber * number in tempArray) {
                if ([number isEqualToNumber:[NSNumber numberWithInteger: navCtrl.tabBarItem.tag]]) {
                    [mutArray addObject:navCtrl]; //此为按照外层循环的顺序 来排序
                    NSLog(@"%@",number);
                }
            }
        }
#endif
        for (NSNumber * number in tempArray) {
            for (UINavigationController * navCtrl in vcs) {
                if ([number integerValue] == navCtrl.tabBarItem.tag) {
                    [mutArray addObject:navCtrl];
                }
            }
        }
        vcs = mutArray;
    }
    
    self.viewControllers = vcs;
    self.delegate = self;
    
}
#pragma mark - 分栏控制器协议方法
-(void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
//    NSLog(@"%s,%d",__FUNCTION__,__LINE__);

}
-(void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    if (changed) {
        NSMutableArray * tempArray = [NSMutableArray array];
        for (UINavigationController * navCtrl in viewControllers) {
//            NSLog(@"%d",vc.tabBarItem.tag);
            [tempArray addObject:[NSNumber numberWithInteger:navCtrl.tabBarItem.tag]];
        }
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:tempArray forKey:@"KEY_ARRAY"];
        [def synchronize];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
