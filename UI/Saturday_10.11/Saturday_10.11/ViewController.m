//
//  ViewController.m
//  Saturday_10.11
//
//  Created by qianfeng on 14-10-11.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{

    NSMutableArray * _dataArray;
    UIView * _view;
}

@end
@interface ViewController (action)
@property (nonatomic,retain)NSString *aaaaaaa;
@end
@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self createButtonAndImageView];
    
    
    [self test2 :(1<<0)];
    [self createBackViewAndTitle];
    [self createButton];

    
}
-(void)createButton
{
    for (int i = 0; i<32; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(0, 40+12*i, 150, 16);
        [btn setTitle:[NSString stringWithFormat:@"第%d个 %@",31-i,_dataArray[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.backgroundColor = [UIColor cyanColor];
        btn.tag = 131-i;
        [_view addSubview:btn];
    }
}
-(void)btnPress:(UIButton *)btn
{

    int sum = 0;
    NSMutableString * str = [NSMutableString string];
    for (NSString * s in _dataArray) {
        [str appendString:s];
    }
    sum = [str intValue];
    NSLog(@"aaaa%d",sum);
    [self test2:(0|(1<<(btn.tag-100)))];
    for (int i = 0; i<32; i++) {
        UIButton * btn = (UIButton *)[self.view viewWithTag:131-i];
        [btn setTitle:[NSString stringWithFormat:@"第%d个 %@",31-i,_dataArray[i]] forState:UIControlStateNormal];
    }
    
//    NSLog(@"%d",(0|(1<<(btn.tag-100))));
    
}
-(void)createBackViewAndTitle
{
    _view = [[UIView alloc] init];
    _view.frame = CGRectMake(10, 20, 300, 440);
    _view.backgroundColor = [UIColor redColor];
    [self.view addSubview:_view];
    NSArray *lableTitle = @[@"功能",@"权限"];
    for (int i = 0; i<2; i++) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0+150*i, 0, 150, 40)];
        label.text = lableTitle[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:30];
        [_view addSubview:label];
    }

}

int b = 0;
char a[32]={};
void test(int num)
{
    int temp = 0;
    if (num<=0)
    {
    }
    else
    {
        temp=num%2;
        num/=2;
        test(num);
        a[b]=temp+'0';
        b++;
    }
}
void test1(int num)
{
    if (num>0)
    {
        test(num);
    }
    else if(num == 0)
    {
        a[b]=0+'0';
    }
    else
    {
        a[b]=1+'0';
        b++;
        num =0-num;
        test(num);
    }
}
-(void)test2:(int) number
{   b=0;
    _dataArray = [NSMutableArray array];
    int num = number;
//    scanf("%d",&num);
    test1(num);
    if (num>0)
    {  
        for (int j=0; j<32-b; j++)
        {
            printf("%c",'0');
            [_dataArray addObject:@"0"];
           
        }
        for (int i = 0; i<b; i++)
        {
            printf("%c",a[i]);
            [_dataArray addObject:[NSString stringWithFormat:@"%c",a[i]]];
        }
        printf("\n");
    }
//    else if(num<0)
//    {
//        printf("%c",a[0]);
//        for (int j=0; j<31-b; j++)
//        {
//            printf("%c",'0');
//        }
//        for (int i = 1; i<b; i++)
//        {
//            printf("%c",a[i]);
//        }
//        printf("\n");
//    }
//    else
//    {
//        for (int i = 0; i<32; i++)
//        {
//            printf("%c",a[b]);
//            [_dataArray addObject:[NSString stringWithFormat:@"%c",a[b]]];
//        }
//        printf("\n");
//    }
    
}




-(void)createButtonAndImageView
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(20, 20, 100, 100);
    btn.backgroundColor = [UIColor lightGrayColor];
    //    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIImageView * imageView =[[UIImageView alloc] initWithFrame:btn.bounds];
    imageView.image = [UIImage imageNamed:@"image2"];
    [btn addSubview:imageView];

}
-(void)btnClick
{
    NSLog(@"dd");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
