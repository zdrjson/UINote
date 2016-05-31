//
//  BookModel.h
//  Sunday_11.2_XML解析
//
//  Created by qianfeng on 14-11-2.
//  Copyright (c) 2014年 zhangderong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject
@property (nonatomic,copy) NSString * bookName;
@property (nonatomic,copy) NSString * autherName;
@property (nonatomic,copy) NSString * bookPrice;
@property (nonatomic,copy) NSString * bookSummary;
@end
/*
 <book id="1" language="ch">
 <name>乔布斯传</name>
 <auther>
 <name>沃尔特·艾萨克森</name>
 </auther>
 <price>80.00</price>
 <summary>一本介绍乔布斯传奇一生的图书。</summary>
 </book>
 */