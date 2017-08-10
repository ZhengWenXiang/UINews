//
//  AppDelegate.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/4.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBarController.h"
#import "LLFullScreenAdView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [RootTabBarController new];
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self addADView];       // 添加广告图
    [self getADImageURL];

    return YES;
}

/** 添加广告图 */
- (void)addADView
{
    LLFullScreenAdView *adView = [[LLFullScreenAdView alloc] init];
    adView.tag = 100;
    adView.duration = 5;
    adView.waitTime = 3;
    adView.skipType = SkipButtonTypeNormalTimeAndText;
    adView.adImageTapBlock = ^(NSString *content) {
        NSLog(@"---%@", content);
    };
    [self.window addSubview:adView];
}

/** 获取广告图URL */
- (void)getADImageURL
{
    // 此处推荐使用tag来获取adView，勿使用全局变量。因为在AppDelegate中将其设为全局变量时，不会被释放
    LLFullScreenAdView *adView = (LLFullScreenAdView *)[self.window viewWithTag:100];
    
    // 模拟从服务器上获取广告图URL
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        NSString *urlString = @"http://pic24.nipic.com/20121008/3822951_094451200000_2.jpg";
        
        [adView reloadAdImageWithUrl:urlString]; // 加载广告图（如果没有设置广告图设置为空）
//    });
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
