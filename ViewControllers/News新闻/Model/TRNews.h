//
//  TRNews.h
//  新闻界面
//
//  Created by zhengwenqing’s mac on 16/3/27.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRNews : NSObject

/** 新闻推送时间 **/
@property (nonatomic,copy)NSString *time;

/** 推送网页 **/
@property (nonatomic,copy)NSString *src;

/** 标题 **/
@property (nonatomic,copy)NSString *title;

/** 网页链接 **/
@property (nonatomic,copy)NSString *url;

/** 新闻图片 **/
@property (nonatomic,copy)NSString *pic;

/** 新闻内容 **/
@property (nonatomic,copy)NSString *content;

+(instancetype)parseNewsJSON:(NSDictionary*)dict;
@end
