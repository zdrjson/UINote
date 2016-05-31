//
//  ImageModel.h
//  Thuesday_11.4_CollctionView
//
//  Created by qianfeng on 14-11-4.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
@property (nonatomic,copy) NSString * thumbnail_url;
@property (nonatomic,copy) NSString * image_height;
@property (nonatomic,copy) NSString * image_width;
@property (nonatomic,assign) CGFloat cellHeight;
+(NSMutableArray *)parsingJsonData:(NSData *)data;
@end
/*
 {
 "has_more": true,
 "message": "success",
 "data": [
 {
 "verified_tag": "ppmm",
 "large_url": "http://ww1.sinaimg.cn/large/005IhR1pjw1elr92d32whj30hs0qon12.jpg",
 "bury_count": 0,
 "timestamp": 1414571827,
 "image_width": 202,
 "share_url": "http://xiangping.com/detail/i166811513/?s=top_week&t=ppmm",
 "middle_url": "http://i0.pstatp.com/medium/7655/7675570943",
 "width": 640,
 "gif_mark": false,
 "thumbnail_url": "http://i0.pstatp.com/thumb/7655/7675570943",
 "comments_count": 0,
 "middle_url2": "http://i.pstatp.com/medium/7655/7675570943",
 "image_height": 303,
 "is_shorten": false,
 "digg_count": 0,
 "height": 960,
 "comments_info": [],
 "id": 217338492,
 "favorite_count": 0,
 "desc": "我发现我有个毛病：就是有人对我好的时候，我总是脸上一副不屑、傲娇样；但实际上我悄悄告诉你：那时候我心里在想，我要怎么样才能对你更好！！"
 },
 */