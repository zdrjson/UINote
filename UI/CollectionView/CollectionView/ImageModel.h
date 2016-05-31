//
//  ImageModel.h
//  CollectionView
//
//  Created by qianfeng on 14-11-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
@property (nonatomic,copy) NSString * imgUrl;
@property (nonatomic,assign) CGFloat imgHeight;
@property (nonatomic,assign) CGFloat imgWidth;
@property (nonatomic,assign) CGFloat cellHeight;
@end
