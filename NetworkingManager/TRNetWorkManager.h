//
//  TRNetWorkManager.h
//  20160323_weather
//
//  Created by zhengwenqing’s mac on 16/3/24.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  根据指定的数据 封装了发送请求的过程
 *  这个实现请求的过程,可以使用AFN 这个第三方
 *  也可以使用NSURLSessionManager
 */
@interface TRNetWorkManager : NSObject

+(void) sendRequestWithUrl:(NSString*)urlStr parameters:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
