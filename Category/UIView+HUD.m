//
//  UIView+HUD.m
//  HappyBuy
//
//  Created by zhengwenqing’s mac on 16/3/28.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "UIView+HUD.h"

//自己写的宏定义要用小k开头,一区分系统级别的宏
#define kShowWarningDelayDuration 1.5

#define kTimeoutDuration 30

@implementation UIView (HUD)

-(void)showWarning:(NSString *)words
{
    //为了使用者考虑,如果子线程执行方法崩溃,我们要把方法做成线程安全的
    dispatch_async(dispatch_get_main_queue(), ^{
         [MBProgressHUD hideAllHUDsForView:self animated:YES];
        //弹出提示 ,
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];//加到当前视图上
        // 模式类型
        hud.mode = MBProgressHUDModeText;
        hud.labelText = words;
        // 1.5 秒后自动消失
        [hud hide:YES afterDelay:kShowWarningDelayDuration];
    });
    
}
-(void)showBusyHUD
{
    dispatch_async(dispatch_get_main_queue(), ^{
         [MBProgressHUD hideAllHUDsForView:self animated:YES];
        //显示忙(菊花样式) 30秒以后自动隐藏掉
        [[MBProgressHUD showHUDAddedTo:self animated:YES] hide:YES afterDelay:kTimeoutDuration];
    });
   
}
-(void)hideBusyHUD
{
    dispatch_async(dispatch_get_main_queue(), ^{
        //隐藏当前界面上所有的提示
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
 
    });
   }
@end
