//
//  NewsViewController.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/4.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "NewsViewController.h"
#import "HomeViewController.h"
#import "BusinessViewController.h"
#import "ChinaViewController.h"
#import "WorldViewController.h"
#import "MenuView.h"
#import "LeftMenuViewDemo.h"

@interface NewsViewController ()<HomeMenuViewDelegate>
{
    NSArray *_dataSource;
}
@property (nonatomic ,strong)MenuView      *menu;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加所有子控制器
//    [self sendRequest];
    self.navigationItem.title = @"界面";
    
    [self setUpUnderLineEffect:^(BOOL *isShowUnderLine, BOOL *isDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor) {
        *isShowUnderLine = YES;
        *isDelayScroll = YES;
        *underLineH = 1.0f;
        
    }];
    [self setUpAllViewController];
    [self addNavigationItem];
    
    LeftMenuViewDemo *demo = [[LeftMenuViewDemo alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.8, kScreenHeight)];
    demo.customDelegate = self;
    
    MenuView *menu = [MenuView MenuViewWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
    self.menu = menu;
}

- (void)addNavigationItem
{
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(10, 0, 30, 30);
    [leftBtn setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickBarButtonItem:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftNav = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftNav;
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(kScreenWidth - 40, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickBarButtonItem:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightNav = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightNav;
}

- (void)clickBarButtonItem:(UIButton *)btn
{
    NSLog(@"click %@ ",btn);
    [self.menu show];
}

-(void)sendRequest
{
    [TRNetWorkManager sendRequestWithUrl:kGetNewsChanel parameters:nil success:^(id responseObject) {
        _dataSource = [TRDataManager getNewsChanelData:responseObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"response:%@",_dataSource);
            
        });
        
        
    } failure:^(NSError *error) {
        NSLog(@"error : %@",error);
    }];
    
}

// 添加所有子控制器
- (void)setUpAllViewController
{
   
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    vc1.title = @"首页";
    [self addChildViewController:vc1];
    
 
    BusinessViewController *vc2 = [[BusinessViewController alloc] init];
    vc2.title = @"商业";
    [self addChildViewController:vc2];
    

    ChinaViewController *vc3 = [[ChinaViewController alloc] init];
    vc3.title = @"中国";
    [self addChildViewController:vc3];
    
    WorldViewController *vc5 = [[WorldViewController alloc] init];
    vc5.title = @"天下";
    [self addChildViewController:vc5];
    
   
    
}


@end
