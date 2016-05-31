//
//  ChatViewController.m
//  iChat
//
//  Created by qianfeng on 14-10-30.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatEngine.h"
#import "LoginUserModel.h"
#import "MsgCell.h"
@interface ChatViewController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
    UIImageView * _msgBar;
    UITextField * _msgText;
}
@end

@implementation ChatViewController

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
    // Do any additional setup after loading the view from its nib.
    [self prepareData];
    [self uiConfig];
    
}
-(void)prepareData
{
    _dataArray = [[NSMutableArray alloc] init];
    [self pickModel];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notAction) name:__kMsg_Received_Notification object:nil];
    
}
-(void)notAction
{
    [self pickModel];
    [_tableView reloadData];
}
-(void)pickModel
{
    [_dataArray removeAllObjects];
    NSMutableArray * arr = [[ChatEngine sharedEngine] msgArray];

    for (MsgModel * model in arr) {
        if ([model.userfromid isEqualToString:_user.userid]||[model.usertoid isEqualToString:_user.userid]) {
            [_dataArray addObject:model];
        }
    }
}
-(void)uiConfig
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    
    CGSize screenSize = [[UIScreen mainScreen]bounds].size;
    _msgBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenSize.height-40, screenSize.width, 40)];
    _msgBar.backgroundColor = [UIColor darkGrayColor];
    _msgBar.userInteractionEnabled = YES;
    [self.view addSubview:_msgBar];
    
    _msgText = [[UITextField alloc] initWithFrame:CGRectMake(2, 2, 316, 36)];
    _msgText.borderStyle = UITextBorderStyleRoundedRect;
    _msgText.returnKeyType = UIReturnKeySend;
    _msgText.delegate = self;
    [_msgBar addSubview:_msgText];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
}
#pragma mark --UITextField
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //发送
    MsgModel * msg = [[MsgModel alloc] init];
    msg.msgtext = _msgText.text;
    msg.msgtype = @"1";
    msg.userfromid = [[LoginUserModel user] userid];
    msg.usertoid = _user.userid;
    msg.isFromMe = YES;
    [[ChatEngine sharedEngine] sendMsg:msg message:^(NSString * msg, BOOL ok) {
        if (ok) {
            NSLog(@"发送成功");
            _msgText.text = @"";
        }
        else
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
    }];
    [textField resignFirstResponder];
    return YES;
}
#pragma mark --UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"cellId";
    MsgCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MsgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = _dataArray[indexPath.row];
    [cell fillData];
//    cell.textLabel.text = [_dataArray[indexPath.row] msgtext];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dataArray[indexPath.row] cellSize].height+20;
}
#pragma mark --Actions
-(void)keyboardChange:(NSNotification *)not
{
//    NSLog(@"%@",not.userInfo);
    NSDictionary * dic = not.userInfo;
    CGFloat duration = [dic[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardFrame = [dic[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat moveY = keyboardFrame.origin.y - self.view.bounds.size.height;
    [UIView animateWithDuration:duration animations:^{
        _msgBar.transform = CGAffineTransformMakeTranslation(0, moveY);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
