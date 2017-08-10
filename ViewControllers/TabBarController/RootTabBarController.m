//
//  RootTabBarController.m
//  WeChat
//
//  Created by zhengwenming on 16/6/5.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "RootTabBarController.h"
#import "BaseNavigationController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"NewsViewController",
                                   kTitleKey  : @"新闻",
                                   kImgKey    : @"tabbar_home_night",
                                   kSelImgKey : @"tabbar_home_selected"},
                                 
                                 @{kClassKey  : @"AudioVisualViewController",
                                   kTitleKey  : @"视听",
                                   kImgKey    : @"tabbar_media_night",
                                   kSelImgKey : @"tabbar_media_selected"},
                                 
                                 @{kClassKey  : @"StunnerViewController",
                                   kTitleKey  : @"尤物",
                                   kImgKey    : @"tabbar_youwu_night",
                                   kSelImgKey : @"tabbar_youwu_selected"},
                                 
                                 @{kClassKey  : @"CommunityViewController",
                                   kTitleKey  : @"社区",
                                   kImgKey    : @"tabbar_community_night",
                                   kSelImgKey : @"tabbar_community_selected"},
                                 
                                 @{kClassKey  : @"MeViewController",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"tabbar_me",
                                   kSelImgKey : @"tabbar_me_selected"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
