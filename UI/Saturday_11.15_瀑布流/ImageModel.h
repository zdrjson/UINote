//
//  ImageModel.h
//  Saturday_11.15_瀑布流
//
//  Created by qianfeng on 14-11-15.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
@property (nonatomic,copy) NSString * image_height;
@property (nonatomic,copy) NSString * image_width;
@property (nonatomic,copy) NSString * large_url;
@property (nonatomic,assign) CGFloat cellHeight;
+(NSMutableArray *)parsingJsonData:(NSData *)data;
@end
