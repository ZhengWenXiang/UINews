//
//  ChinaViewController.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/5.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "ChinaViewController.h"

@interface ChinaViewController ()
@property (nonatomic , strong) UIImageView *imageView;
@property (nonatomic , strong) NSTimer *timer;
@end

#define FPS 6.0

@implementation ChinaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%@",timer);
    }];
    [self.timer invalidate];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.view addSubview:imageView];
    imageView.center = self.view.center;
    imageView.frame = CGRectMake(100, 100, 200, 200);
    imageView.image = [UIImage imageNamed:@"bg_3x"];
    
    UIImageView *subImage = [[UIImageView alloc]init];
    subImage.center = imageView.center;
    [imageView addSubview:subImage];
    subImage.frame = CGRectMake(50, 50, 100, 100);
    
    subImage.image = [UIImage imageNamed:@"round1_3x"];
    
    
    
    UIImage *image = [UIImage animatedImageNamed:@"" duration:5*1/FPS];
    self.imageView = [[UIImageView alloc]init];
    self.imageView.frame = CGRectMake(0, 0, 128, 128);
    self.imageView.center = self.view.center;
    self.imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
