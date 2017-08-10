//
//  BusinessViewController.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/5.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "BusinessViewController.h"
#import "HomeTitleCell.h"
#import "UIView+HUD.h"
#import "TRNews.h"
#import "ContentViewController.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"

@interface BusinessViewController ()
@property (nonatomic , strong) NSArray *allNewsArray;
@property (nonatomic , assign) CGFloat cellHeight;

@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCellWithClass:@"HomeTitleCell" tableView:self.tableView];
    
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavbarHeight-kTabBarHeight-44);
    [self.view addSubview:self.tableView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;//这个貌似是收起键盘
    
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [weakSelf sendRequest];
            [weakSelf.tableView endHeaderRefresh];
        });
    }];
    
    [self.tableView beginHeaderRefresh];
}
#pragma mark 发送网络请求
-(void)sendRequest
{
    [TRNetWorkManager sendRequestWithUrl:kNewsHTTPURL parameters:nil success:^(id responseObject) {
        _allNewsArray = [TRDataManager getAllNewsData:responseObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            NSLog(@"response:%@",_allNewsArray);
            
        });
        
        
    } failure:^(NSError *error) {
        NSLog(@"error : %@",error);
        [self.view showWarning:@"当前无网络,请稍后再试"];
    }];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TRNews *model = nil;
    if (indexPath.row < _allNewsArray.count) {
        model = [_allNewsArray objectAtIndex:indexPath.row];
    }
    
    return [HomeTitleCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        HomeTitleCell *cell = (HomeTitleCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    } cache:^NSDictionary *{
        return @{kHYBCacheUniqueKey: [NSString stringWithFormat:@"%@", model.title],
                 kHYBCacheStateKey : @"",
                 // 如果设置为YES，若有缓存，则更新缓存，否则直接计算并缓存
                 // 主要是对社交这种有动态评论等不同状态，高度也会不同的情况的处理
                 kHYBRecalculateForStateKey : @(NO) // 标识不用重新更新
                 };
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allNewsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTitleCell"];
    cell = [[HomeTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeTitleCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    TRNews *news = _allNewsArray[indexPath.row];
    cell.layer.borderColor = [UIColor blueColor].CGColor;
    cell.layer.borderWidth = 2;
    [cell.newsImage sd_setImageWithURL:[NSURL URLWithString:news.pic] placeholderImage:[UIImage imageNamed:@"bitmap4_3"]];
    cell.newsTitle.text = @"娃哈哈正在寻求大型国际并购";
        //        cell.newsSubTitle.text = @"消费| 文祥 3小时前";
    cell.newsTitle.text = news.title;
    cell.newsSubTitle.text = news.time;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TRNews *news = _allNewsArray[indexPath.row];
    ContentViewController *svc = [[ContentViewController alloc]init];
    svc.urlStr = news.url;
    svc.titleStr = news.title;
    svc.contentStr = news.content;
    NSLog(@"content : %@",news.content);
    [self.navigationController pushViewController:svc animated:YES];
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
