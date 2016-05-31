//
//  ADViewCell.m
//  Friday_10.3
//
//  Created by qianfeng on 14-10-5.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import "ADViewCell.h"
#import "ADModel.h"
@implementation ADViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(0, 0, 320, 160);
//        _aDArray = [NSMutableArray array];
    }
    return self;
}
-(void)loadAdDataModel:(NSMutableArray *)aDArray
{
    _aDArray = aDArray;
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.contentSize = CGSizeMake(aDArray.count *self.bounds.size.width, self.bounds.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.contentView addSubview:_scrollView];
  
    for (int i = 0; i<aDArray.count; i++)
    {
        ADModel * adModel = [aDArray objectAtIndex:i];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+i*self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        imageView.image = [UIImage imageNamed:adModel.adImageName];
        [_scrollView addSubview:imageView];
    }
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, 320, 20)];
    _labelTitle.backgroundColor = [UIColor lightGrayColor];
    ADModel * adModel = [_aDArray objectAtIndex:0];
    _labelTitle.alpha = 0.5;
    _labelTitle.text = adModel.adTitleName;
    [self.contentView addSubview:_labelTitle];
    
    _pageController = [[UIPageControl alloc] initWithFrame:CGRectMake(220, 140, 100, 20)];
    _pageController.numberOfPages = aDArray.count;
    [_pageController addTarget:self action:@selector(pageControllerClicked:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:_pageController];
    
}
-(void)pageControllerClicked:(UIPageControl *)pageCotroller
{
    int curIndex = pageCotroller.currentPage;
    _scrollView.contentOffset = CGPointMake( _scrollView.bounds.size.width * curIndex, 0);
    ADModel * adModel = [_aDArray objectAtIndex:curIndex];
    _labelTitle.text = adModel.adTitleName;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x/scrollView.bounds.size.width;
    NSLog(@"%d",index);
    ADModel * adModel = [_aDArray objectAtIndex:index];
    _labelTitle.text = adModel.adTitleName;
    _pageController.currentPage = index;

}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
