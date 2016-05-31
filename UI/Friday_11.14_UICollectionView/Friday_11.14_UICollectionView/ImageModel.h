//
//  ImageModel.h
//  Friday_11.14_UICollectionView
//
//  Created by qianfeng on 14-11-14.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
@property (nonatomic,copy) NSString * thumbnail_url;
@property (nonatomic,copy) NSString * image_width;
@property (nonatomic,copy) NSString * image_height;
@property (nonatomic,assign) CGFloat cellHeight;
+(NSMutableArray *)parsingJsonData:(NSData *)data;
@end
/*
 data": [
 {
 "verified_tag": "ppmm",
 "large_url": "http://ww3.sinaimg.cn/large/a949a9f5jw1em835ejmn7j20dc0hsjsf.jpg",
 "bury_count": 0,
 "timestamp": 1415922653,
 "image_width": 202,
 "share_url": "http://xiangping.com/detail/i167608013/?s=top_week&t=ppmm",
 "middle_url": "http://i0.pstatp.com/medium/7893/5562134238",
 "width": 480,
 "gif_mark": false,
 "thumbnail_url": "http://i0.pstatp.com/thumb/7893/5562134238",
 "comments_count": 0,
 "middle_url2": "http://i.pstatp.com/medium/7893/5562134238",
 "image_height": 269,
 "is_shorten": false,
 "digg_count": 1,
 "height": 640,
 "comments_info": [],
 "id": 217611208,
 "favorite_count": 0,
 "desc": ""
 },
 */