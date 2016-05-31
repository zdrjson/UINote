//
//  Tools.h
//  iChat
//
//  Created by huangdl on 14-10-30.
//  Copyright (c) 2014年 1000phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject
+(NSString *)stringFromChURL:(NSString *)str;

+(CGSize)sizeOfStr:(NSString *)str andFont:(UIFont *)font andMaxSize:(CGSize)size andLineBreakMode:(NSLineBreakMode)mode;

@end
