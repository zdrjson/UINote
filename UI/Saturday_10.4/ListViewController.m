//
//  ListViewController.m
//  Saturday_10.4
//
//  Created by qianfeng on 14-10-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ListViewController.h"

@interface VCTypeObject : NSObject

@property (nonatomic,assign) int type;
-(NSString *)getTitle;
-(UITabBarItem *)getUITabBarItem;
+(id)shareData;
@end

@implementation VCTypeObject
+(id)shareData
{
    static VCTypeObject *_s = nil;
    if (!_s) {
        _s = [[[self class] alloc]init];
//        [_s getTitle];
//        [_s getUITabBarItem];
    }
    return _s;
}
-(NSString *)getTitle
{
    
    return [NSString stringWithFormat:@"界面%d",_type];
}
-(UITabBarItem *)getUITabBarItem
{
    UITabBarItem * item = [[UITabBarItem alloc] initWithTabBarSystemItem:_type+3 tag:_type+101];
//    NSLog(@"%d",item.tag);
    return item;
}
@end

@interface ListViewController ()
{
    VCTypeObject * _vcTypeObject;
}
@end

@implementation ListViewController
- (instancetype)initWithType:(int)type
{
    self = [super init];
    if (self) {
        _type=type;
        _vcTypeObject =  [VCTypeObject shareData];
        _vcTypeObject.type = _type;
        [self createTabBarItem];
        [self createTitle];
    }
    return self;
}
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
    //    NSMutableArray * arr  = [NSMutableArray array];
    //    [arr addObject:@1];
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
-(void)createTitle
{
    self.title= [_vcTypeObject getTitle];
  
}
-(void)createTabBarItem
{
    self.tabBarItem = [_vcTypeObject getUITabBarItem];

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
