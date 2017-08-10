//
//  HomeViewController.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/5.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTitleCell.h"
#import "UIView+HUD.h"
#import "TRNews.h"
#import "ContentViewController.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "LeftMenuViewDemo.h"
#import "MenuView.h"

@interface HomeViewController ()<HomeMenuViewDelegate,SDCycleScrollViewDelegate>
{
    NSArray *_allNewsArray;
}
@property (nonatomic ,strong) MenuView      *menu;//左侧菜单
@property (strong ,nonatomic) SDCycleScrollView *topPhotoBoworr;
@property (nonatomic , strong) UIActivityIndicatorView *activity;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self registerCellWithClass:@"UITableViewCell" tableView:self.tableView];
    [self registerCellWithClass:@"HomeTitleCell" tableView:self.tableView];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavbarHeight-kTabBarHeight-39);
    [self.view addSubview:self.tableView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;//这个貌似是收起键盘
    
    self.activity = [[UIActivityIndicatorView alloc]init];
    self.activity.frame = CGRectMake(kScreenWidth/2-30, kScreenHeight/2-30, 30, 30);
    self.activity.center = self.view.center;
    self.activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:self.activity];
    [self.activity startAnimating];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
            [weakSelf sendRequest];
            [weakSelf.tableView endHeaderRefresh];
            
        });
    }];
   
    [self.tableView beginHeaderRefresh];
    
    LeftMenuViewDemo *demo = [[LeftMenuViewDemo alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.8, kScreenHeight)];
    demo.customDelegate = self;
    
    MenuView *menu = [MenuView MenuViewWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
    //    MenuView *menu = [[MenuView alloc]initWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
    self.menu = menu;

    [self.activity stopAnimating];
}


#pragma mark -- SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"This is %d",index);
}

- (SDCycleScrollView *)topPhotoBoworr{
    if (_topPhotoBoworr == nil) {
        _topPhotoBoworr = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2) delegate:self placeholderImage:nil];
        _topPhotoBoworr.bannerImageViewContentMode = UIViewContentModeScaleToFill;
        _topPhotoBoworr.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _topPhotoBoworr.infiniteLoop = YES;
        _topPhotoBoworr.autoScroll = YES;
        _topPhotoBoworr.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _topPhotoBoworr.titleLabelHeight = 60;
        _topPhotoBoworr.imageURLStringsGroup = @[@"http://www.pp3.cn/uploads/201405/13825177964.jpg",@"http://www.pp3.cn/uploads/201405/13825177964.jpg",@"http://pic1.5442.com/2015/0728/14/03.jpg"];
        _topPhotoBoworr.titlesGroup = @[@"超级简单又好看的流行编发教程",@"高贵的典雅 爆乳性感美女车模 岁月...多想把",@" 2017时尚流行发型 ",@"爆乳性感美女车模 岁月...多想把"];
    }
    return _topPhotoBoworr;
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


#pragma mark -- 去掉UItableview headerview黏性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGFloat sectionHeaderHeight = kScreenWidth/2;
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
    return;
}

#pragma mark -- UITableViewDataSource And UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kScreenWidth/2;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2)];
    [headerView addSubview:self.topPhotoBoworr];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    }else{
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
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allNewsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTitleCell"];
    
    cell = [[HomeTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeTitleCell"];
    TRNews *news = _allNewsArray[indexPath.row];
    if (indexPath.row==0) {
        cell.textLabel.text = @"中国提醒部分投资者在一带一路峰会期间故事监管将更严格";
        cell.textLabel.font = FONT(16);
        cell.textLabel.numberOfLines = 0;
    }else {
        [cell.newsImage sd_setImageWithURL:[NSURL URLWithString:news.pic] placeholderImage:[UIImage imageNamed:@"bitmap4_3"]];
        cell.newsTitle.text = @"娃哈哈正在寻求大型国际并购";
//        cell.newsSubTitle.text = @"消费| 文祥 3小时前";
        cell.newsTitle.text = news.title;
        cell.newsSubTitle.text = news.time;
    }
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

#pragma mark -- HomeMenuViewDelegate
-(void)LeftMenuViewClick:(NSInteger)tag{
    [self.menu hidenWithAnimation];
    NSString *tagstr = [NSString stringWithFormat:@"%d",tag];
    [[[UIAlertView alloc] initWithTitle:@"提示" message:tagstr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}

@end
