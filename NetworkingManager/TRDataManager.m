//
//  TRDataManager.m
//  新闻界面
//
//  Created by zhengwenqing’s mac on 16/3/27.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import "TRDataManager.h"
#import "TRNews.h"
#import "HotNewsModel.h"

@implementation TRDataManager

+(NSArray *)getAllNewsData:(id)responseObject
{
    
    NSArray *newsArray = responseObject[@"result"][@"list"];

    NSMutableArray *allNews = [NSMutableArray array];
    
    for (NSDictionary *dict in newsArray) {
        TRNews *news = [TRNews parseNewsJSON:dict];
        [allNews addObject:news];
    }
    return allNews;   
}

+(NSArray *)getALLHotNewsData:(id)responseObject
{
    NSArray *hotNews = responseObject[@"retData"];
    NSMutableArray *allHotNews = [NSMutableArray array];
    for (NSDictionary *dict in hotNews) {
        HotNewsModel *model = [HotNewsModel parseChanelModelJSON:dict];
        [allHotNews addObject:model];
    }
    return allHotNews;
}

+ (NSArray *)getNewsChanelData:(id)responseObject
{
    NSArray *newsArray2 = responseObject[@"result"];
    NSMutableArray *allNews1 = [NSMutableArray array];
    for (NSDictionary *dict in newsArray2) {
        TRNews *news1 = [TRNews parseNewsJSON:dict];
        [allNews1 addObject:news1];
    }
    return allNews1;

}
@end
