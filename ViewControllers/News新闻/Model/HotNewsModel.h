//
//  HotNewsModel.h
//  新闻界面
//
//  Created by zhengwenqing’s mac on 16/3/30.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HotNewsModel : NSObject


@property (nonatomic, copy) NSString *title;
//image_url
@property (nonatomic, copy) NSString *imageURL;
//url
@property (nonatomic, copy) NSString *URL;
// abstract
@property (nonatomic, copy) NSString *abStract;

@property (nonatomic , strong) NSArray *chanelArr;

+(instancetype)parseHotNewsModelJSON:(NSDictionary  *)dict;

+(instancetype)parseChanelModelJSON:(NSDictionary  *)dict;

@end

