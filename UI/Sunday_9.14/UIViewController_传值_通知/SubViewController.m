//
//  SubViewController.m
//  Sunday_9.14
//
//  Created by qianfeng on 14-9-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

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
    self.view.backgroundColor = [UIColor yellowColor];
    [self createSwitch];
}
-(void)createSwitch
{
    UISwitch *sw = [[UISwitch alloc]initWithFrame:CGRectMake(20,30, 300, 300)];
    
    sw.tintColor =[UIColor magentaColor];
    
    sw.onTintColor = [UIColor redColor];
    
    sw.thumbTintColor = [UIColor purpleColor];
    
    [sw addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sw];
    
    

}
-(void)switchValueChanged:(UISwitch *)sw
{
#if 0
    BOOL res = sw.isOn;
    if (res==YES) {
        NSLog(@"YES");
    }
    else
    {
        NSLog(@"NO");
        
    }
    
#endif
    
    NSMutableDictionary * dict =nil;
    if (sw.isOn==YES) {
        dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"打开",@"YES", nil];
       
    }
    else
    {
        dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"关闭",@"NO",nil];
    }

    NSNotification *not =[[NSNotification alloc] initWithName:@"SwitchOpenorClose" object:nil userInfo:dict];
    
    [[NSNotificationCenter defaultCenter] postNotification:not];
    


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
