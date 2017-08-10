//
//  TRNews.m
//  新闻界面
//
//  Created by zhengwenqing’s mac on 16/3/27.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import "TRNews.h"

@implementation TRNews

+(instancetype)parseNewsJSON:(NSDictionary *)dict
{
    TRNews *news = [[TRNews alloc]init];
    news.time = dict[@"time"];
    news.src = dict[@"src"];
    news.title = dict[@"title"];
//    news.link = dict[@"link"];
//    NSMutableArray *array = dict[@"imageurls"];
//    //如果取出来的数组有为 空 的要判断
//    if(array.count == 0){
//        return news;
//    }else{
        news.pic = dict[@"pic"];
//    }
    news.url = dict[@"url"];
    news.content = dict[@"content"];
    
    return news;
}


@end
