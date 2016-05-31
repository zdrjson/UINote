//
//  RootViewController.m
//  Thursday_9.18
//
//  Created by qianfeng on 14-9-18.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "RootViewController.h"
#import "ChineseToPinyin.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)createData
{
    _arrayChinese = [[NSMutableArray alloc] init];
    [_arrayChinese addObject:@"姚明"];
    [_arrayChinese addObject:@"刘翔"];
    [_arrayChinese addObject:@"周立波"];
    [_arrayChinese addObject:@"习近平"];
    [_arrayChinese addObject:@"李克强"];
    [_arrayChinese addObject:@"王岐山"];
    [_arrayChinese addObject:@"吴刚"];
    [_arrayChinese addObject:@"朱双其"];
    [_arrayChinese addObject:@"蔡海荣"];
    [_arrayChinese addObject:@"元芳"];
    
    _dictPinyinAndChinese = [[NSMutableDictionary alloc]init];
    
    for (NSString * name in _arrayChinese) {
        NSString * pinYin = [ChineseToPinyin pinyinFromChiniseString:name];
        NSString  * charFirst = [pinYin substringToIndex:1];
        NSMutableArray * charArray = [_dictPinyinAndChinese objectForKey:charFirst];
        if (charArray==nil) {
            NSMutableArray *subArray = [[NSMutableArray alloc] init];
            [subArray  addObject: name];
            [_dictPinyinAndChinese setObject:subArray forKey:charFirst];
        }
        else
        {
            [charArray addObject:name];
        }
    }
//    for (NSString * key in [_dictPinyinAndChinese allKeys]) {
//        NSLog(@"%@",key);
//        for (NSString * str in [_dictPinyinAndChinese objectForKey:key]) {
//            NSLog(@"%@",str);
//        }
//    }
    for (int i = 0; i<26; i++)
    {
        for (NSString *key in [_dictPinyinAndChinese allKeys])
        {
            if ([[NSString stringWithFormat:@"%c",'A'+i] isEqualToString:key])
            {
                
            }
        }
    
    
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
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
