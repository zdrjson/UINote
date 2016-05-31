//
//  QFTabBarController.m
//  SianProject
//
//  Created by qianfeng on 14-10-1.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "QFTabBarController.h"
#import "QFTabItem.h"
@interface QFTabPrivate :NSObject

@property (nonatomic,retain) NSString * normarImage;
@property (nonatomic,retain) NSString * selectedImage;
@property (nonatomic,retain) UIViewController * controller;

@end

@implementation QFTabPrivate



@end

@interface QFTabBarController ()

@end

@implementation QFTabBarController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBar.hidden = YES;
        _controllerArr = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void)setViewControllers:(NSArray *)viewControllers
{
    NSMutableArray * arr= [[NSMutableArray alloc] init];
    for (NSDictionary * d in viewControllers) {
        UIViewController * c =d[kViewContrller];
        QFTabPrivate * tp = [[QFTabPrivate alloc] init];
        tp.normarImage = d[kNormarlImage];
        tp.selectedImage = d[kSelcectedImage];
        tp.controller = c;
        [_controllerArr addObject:tp];
        [arr addObject:c];
    }
    super.viewControllers = arr;
    [self createTabBar];
}
#define kTabWidth 320.0f
#define kTabHeight 49.0f
#define kScreenHeight 480.0f
-(void)createTabBar
{
    CGFloat y = kScreenHeight - kTabHeight;
    CGRect rect = CGRectMake(0, y , kTabWidth, kTabHeight);
   _imageView = [[QFImageView alloc] initWithFrame:rect];
    _imageView.image = [UIImage imageNamed:@""];
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:_imageView];
    [self createItems];
}
#define kXPad 10
#define kMaxTabItems 5
#define MAKTAG(a) ((a)+1)
#define GETTAG(a) ((a)-1)
-(void)createItems
{
    int numOfTabs = MIN(_controllerArr.count, kMaxTabItems);
    float width = (kTabWidth -(numOfTabs+1) * kXPad)/numOfTabs;
    float height = kTabHeight;
    for (int i = 0; i<numOfTabs; i++) {
        float x = kXPad +(kXPad+width)*i;
        CGRect rect = CGRectMake(x, 0, width, height);
        QFTabItem * itemView = [[QFTabItem alloc] initWithFrame:rect];
        QFTabPrivate * tp = [_controllerArr objectAtIndex:i];
        [itemView setNormalImage:[UIImage imageNamed:tp.normarImage]];
        [itemView setHighlightImage:[UIImage imageNamed:tp.selectedImage]];
        itemView.tag = MAKTAG(i);
        [itemView addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:itemView];
    }
}
-(void)itemClick:(QFTabItem *)item
{
    int index = GETTAG(item.tag);
    self.selectedIndex = index;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
