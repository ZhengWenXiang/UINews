//
//  UIView+HUD.h
//  HappyBuy
//
//  Created by zhengwenqing’s mac on 16/3/28.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"

@interface UIView (HUD)
/**
 *  提示框 统一三方类库的入口
 *
 *  @param words 弹出框的文字
 */
- (void)showWarning:(NSString*)words;

/**
 *  显示 忙提示
 */

- (void)showBusyHUD;

/**
 *  隐藏忙提示
 */
-(void)hideBusyHUD;

@end
