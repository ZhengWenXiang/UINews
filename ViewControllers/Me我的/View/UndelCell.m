//
//  UndelCell.m
//  界面新闻
//
//  Created by wenxiang'Z on 2017/5/23.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "UndelCell.h"

@implementation UndelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)cellImage:(UIImage *)image cellTitle:(NSString *)title
{
    self.icon.image = image;
    self.title.text = title;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
