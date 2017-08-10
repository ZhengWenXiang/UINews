//
//  TRNetWorkManager.m
//  20160323_weather
//
//  Created by zhengwenqing’s mac on 16/3/24.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import "TRNetWorkManager.h"
#import "AFNetworking.h"

@implementation TRNetWorkManager

+(void)sendRequestWithUrl:(NSString *)urlStr parameters:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
    
    [manager.requestSerializer setValue:@"8ded2121cc50d19e26520009bc1a8915" forHTTPHeaderField:@"apikey"];
    
    [manager GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功回调success 方法
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}
@end
