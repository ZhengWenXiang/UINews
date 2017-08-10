//
//  HomeTitleCell.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/9.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "HomeTitleCell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "TRNews.h"

@implementation HomeTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         self.selectionStyle = UITableViewCellSelectionStyleNone;
        _newsImage = [UIImageView new];
        [self addSubview:_newsImage];
        [_newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kScreenWidth, kScreenWidth/2));
            make.top.mas_equalTo(10);

        }];
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        // 应该始终要加上这一句
        // 不然在6/6plus上就不准确了
        _newsTitle = [UILabel new];
        _newsTitle.numberOfLines = 0;
        _newsTitle.font = FONT(16);
        _newsTitle.preferredMaxLayoutWidth = w - 20;
        [self addSubview:_newsTitle];
        [_newsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(10);
            make.right.mas_equalTo(self).offset(-10);
            make.top.mas_equalTo(_newsImage.mas_bottom).with.offset(8);
           
        }];
       
        _newsSubTitle = [UILabel new];
        _newsSubTitle.font = FONT(12);
        _newsSubTitle.textColor = [UIColor lightGrayColor];
        _newsSubTitle.preferredMaxLayoutWidth = w - 20;
        [self addSubview:_newsSubTitle];
        [_newsSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(10);
            make.right.mas_equalTo(self).offset(-10);
            make.top.equalTo(_newsTitle.mas_bottom).with.offset(8);
        }];
        
        _newsAlready = [UILabel new];
        _newsAlready.font = FONT(12);
        _newsAlready.textColor = [UIColor lightGrayColor];
        _newsAlready.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_newsAlready];
        [_newsAlready mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).with.offset(-10);
            make.top.equalTo(_newsTitle.mas_bottom).with.offset(8);
        }];
    }
    // 必须加上这句
    self.hyb_lastViewInCell = _newsSubTitle;
    self.hyb_bottomOffsetToCell = 8;
    return self;
}

- (void)configCellWithModel:(TRNews *)model {
    
    self.newsTitle.text = model.title;
    self.newsSubTitle.text = model.time;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
