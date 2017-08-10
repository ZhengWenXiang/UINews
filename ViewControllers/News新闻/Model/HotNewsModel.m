//
//  HotNewsModel.m
//  新闻界面
//
//  Created by zhengwenqing’s mac on 16/3/30.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import "HotNewsModel.h"

@implementation HotNewsModel

+(instancetype)parseHotNewsModelJSON:(NSDictionary *)dict
{
    HotNewsModel *hotNews = [[HotNewsModel alloc]init];
    hotNews.title = dict[@"title"];
    hotNews.imageURL = dict[@"image_url"];
    hotNews.URL = dict[@"url"];
    hotNews.abStract = dict[@"abstract"];
    return hotNews;
}


+(instancetype)parseChanelModelJSON:(NSDictionary  *)dict
{
    HotNewsModel *chanel = [HotNewsModel new];
    chanel.chanelArr = dict[@"result"];
    return chanel;
}

@end


