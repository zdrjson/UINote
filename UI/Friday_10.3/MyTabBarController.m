//
//  MyTabBarController.m
//  Friday_10.3
//
//  Created by qianfeng on 14-10-3.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MyTabBarController.h"
#import "Common.h"
#define DEFINTE_CONTROLLER(CName,NavInstance,tmpName)  CName * tmpName = [[CName alloc] init];\
UINavigationController * NavInstance = [[UINavigationController alloc] initWithRootViewController:tmpName]
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
    [self createSubViews];
     
}
-(void)createSubViews
{
    DEFINTE_CONTROLLER(FirstViewController, firstNavCtrl, firstVC);
    DEFINTE_CONTROLLER(SecondViewController, secondNavCtrl, secondVC);
    DEFINTE_CONTROLLER(ThirdViewController, thirdNavCtrl, thirdVC);
    DEFINTE_CONTROLLER(FourthViewController, fourNavCtrl, fourthVC);
    self.viewControllers = @[firstNavCtrl,secondNavCtrl,thirdNavCtrl,fourNavCtrl];
    
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
