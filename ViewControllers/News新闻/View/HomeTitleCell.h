//
//  HomeTitleCell.h
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/9.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TRNews;
@interface HomeTitleCell : UITableViewCell
@property (nonatomic , strong) UILabel *newsTitle;
@property (nonatomic , strong) UIImageView *newsImage;
@property (nonatomic , strong) UILabel *newsSubTitle;
@property (nonatomic , strong) UILabel *newsAlready;

//+ (CGFloat)heightWithModel:(TRNews *)model;

- (void)configCellWithModel:(TRNews *)model;
@end
