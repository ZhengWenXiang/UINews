//
//  LeftView.m
//  界面新闻
//
//  Created by wenxiang'Z on 2017/6/23.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.colorlView.backgroundColor = randomColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
