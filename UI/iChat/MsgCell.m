//
//  MsgCell.m
//  iChat
//
//  Created by qianfeng on 14-10-31.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "MsgCell.h"

@implementation MsgCell
{
    UIImageView * _leftTextBox;
    UIImageView * _rightTextBox;
    UILabel * _leftLabel;
    UILabel * _rightLabel;
}
- (void)awakeFromNib
{
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self uiConfig];
    }
    return self;
}
-(void)uiConfig
{
    _leftTextBox = [[UIImageView alloc] init];
    UIImage * leftImage = [UIImage imageNamed:@"ReceiverTextNodeBkg"];
    leftImage = [leftImage stretchableImageWithLeftCapWidth:30 topCapHeight:35];
    _leftTextBox.image = leftImage;
    [self.contentView addSubview:_leftTextBox];
    
    _rightTextBox = [[UIImageView alloc] init];
    UIImage * rightImage = [UIImage imageNamed:@"SenderTextNodeBkg"];
    rightImage = [rightImage stretchableImageWithLeftCapWidth:30 topCapHeight:35];
    _rightTextBox.image = rightImage;
    [self.contentView addSubview:_rightTextBox];
    
    _leftLabel = [[UILabel alloc] init];
    _leftLabel.font = [UIFont systemFontOfSize:12];
    _leftLabel.numberOfLines = 0;
    _leftLabel.backgroundColor = [UIColor clearColor];
    [_leftTextBox addSubview:_leftLabel];
    
    _rightLabel = [[UILabel alloc] init];
    _rightLabel.font = [UIFont systemFontOfSize:12];
    _rightLabel.numberOfLines = 0;
    _rightLabel.backgroundColor = [UIColor clearColor];
    [_rightTextBox addSubview:_rightLabel];

}
-(void)fillData
{
    _leftTextBox.hidden = YES;
    _rightTextBox.hidden = YES;
    if (_model.isFromMe) {
        _rightTextBox.hidden = NO;
        _rightTextBox.frame = CGRectMake(310-(_model.cellSize.width+30), 5, _model.cellSize.width+30, _model.cellSize.height+20);
        _rightLabel.frame = CGRectMake(10, 5, _model.cellSize.width, _model.cellSize.height);
        _rightLabel.text = _model.msgtext;
       
    }
    else
    {
        _leftTextBox.hidden = NO;
        _leftTextBox.frame = CGRectMake(10, 5, _model.cellSize.width+30, _model.cellSize.height+20);
        _leftLabel.frame = CGRectMake(15, 5, _model.cellSize.width, _model.cellSize.height);
        _leftLabel.text = _model.msgtext;
    }
        
}
+(void)calcHeight:(MsgModel *)model
{
    CGSize size = [Tools sizeOfStr:model.msgtext andFont:[UIFont systemFontOfSize:12] andMaxSize:CGSizeMake(200, 999999) andLineBreakMode:NSLineBreakByWordWrapping];
    model.cellSize = size;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
