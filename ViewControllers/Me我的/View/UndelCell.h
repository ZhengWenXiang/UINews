//
//  UndelCell.h
//  界面新闻
//
//  Created by wenxiang'Z on 2017/5/23.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UndelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UISwitch *isSwitch;

- (void)cellImage:(UIImage *)image cellTitle:(NSString *)title;

@end
