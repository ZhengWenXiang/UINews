//
//  AudioVisualViewController.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/4.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "AudioVisualViewController.h"
#import "VideoController.h"
#import "VoiceController.h"

@interface AudioVisualViewController ()

@property (nonatomic , assign) NSInteger selectedSegmentIndex;
@end

@implementation AudioVisualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"视频",@"音频"]];
    segment.frame = CGRectMake(60,100,200, 30);
    self.navigationItem.titleView = segment;
    segment.selectedSegmentIndex = 0;//选择按下标
    segment.momentary = NO;//点完以后会起来,按钮(瞬间选中离开)默认为NO
    segment.tintColor = [UIColor redColor];
    [segment addTarget:self action:@selector(handelSegementControlAction:)forControlEvents:(UIControlEventValueChanged)];
    [self addChildViewController:[VideoController new]];
    
    VideoController *vc1 = [[VideoController alloc]init];
    vc1.view.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight);
    [self addChildViewController:vc1];
    [self.view addSubview:vc1.view];
}

- (void)handelSegementControlAction:(UISegmentedControl *)sender
{
    NSLog(@"%d",sender.selectedSegmentIndex);
    if (sender.selectedSegmentIndex == 0) {
        VideoController *vc1 = [[VideoController alloc]init];
        vc1.view.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight);
        [self addChildViewController:vc1];
        [self.view addSubview:vc1.view];
    }else{
        VoiceController *vc1 = [[VoiceController alloc]init];
        vc1.view.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight);
        [self addChildViewController:vc1];
        [self.view addSubview:vc1.view];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
