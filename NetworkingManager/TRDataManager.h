//
//  TRDataManager.h
//  新闻界面
//
//  Created by zhengwenqing’s mac on 16/3/27.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDataManager : NSObject

/**
 *  得到所有的新闻数据
 */
+(NSArray *)getAllNewsData:(id)responseObject;


/**
 *  得到热点新闻
 */
+(NSArray *)getALLHotNewsData:(id)responseObject;

//新闻频道
+ (NSArray *)getNewsChanelData:(id)responseObject;

@end
