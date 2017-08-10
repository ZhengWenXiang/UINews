//
//  MeViewController.m
//  界面新闻
//
//  Created by 郑文祥 on 2017/5/4.
//  Copyright © 2017年 郑文祥. All rights reserved.
//

#import "MeViewController.h"
#import "HeaderCell.h"
#import "MiddleCell.h"
#import "UndelCell.h"
#import "UIScrollView+HeaderScaleImage.h"

#define kTitleKey   @"title"
#define kImgKey     @"imageName"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) NSArray *cellData1;
@property (nonatomic , strong) NSArray *cellData2;
@property (nonatomic , strong) NSArray *cellData3;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationItem];
    
    self.tableView = [UITableView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
//    }];
    self.tableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight-64);
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MiddleCell class]) bundle:nil] forCellReuseIdentifier:@"MiddleCell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UndelCell class]) bundle:nil] forCellReuseIdentifier:@"UndelCell"];
   
    self.tableView.yz_headerScaleImage = [UIImage imageNamed:@"header.JPG"];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kScreenWidth / 2 - 100)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"my_default_head"];
    [headerView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.centerY.equalTo(headerView.mas_centerY).offset(20.0);
        make.center.equalTo(headerView).centerOffset(CGPointMake(0, -60));
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    UILabel *userName = [UILabel new];
    userName.text = @"登录 / 注册";
    userName.textColor = [UIColor whiteColor];
    userName.font =  [UIFont fontWithName:@"Helvetica-Bold" size:17];
    [headerView addSubview:userName];
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(headerView).centerOffset(CGPointMake(0, -8));
    }];
}

- (NSArray *)cellData1
{
    if (!_cellData1) {
        _cellData1 = [NSArray array];
        _cellData1 = @[
                       @{kTitleKey  : @"我收藏的精华",
                         kImgKey    : @"my_icon_favorite"},
                       
                       @{kTitleKey  : @"我订阅的主题",
                         kImgKey    : @"my_icon_theme"},
                       
                       @{kTitleKey  : @"我关注的作者",
                         kImgKey    : @"my_icon_subcribe"},
                       ];
        
    }
    return _cellData1;
    
}

- (NSArray *)cellData2
{
    if (!_cellData2) {
        _cellData2 = [NSArray array];
        _cellData2 = @[
                       @{kTitleKey  : @"无图模式",
                         kImgKey    : @"my_icon_noneimage"},
                       
                       @{kTitleKey  : @"夜间模式",
                         kImgKey    : @"my_icon_day"},
                       ];
    }
    return _cellData2;
}

- (NSArray *)cellData3
{
    if (!_cellData3) {
        _cellData3 = [NSArray array];
        _cellData3 = @[
                       @{kTitleKey  : @"离线阅读",
                         kImgKey    : @"my_icon_download"},
                       
                       @{kTitleKey  : @"意见反馈",
                         kImgKey    : @"my_icon_feedback"},
                       ];
    }
    return _cellData3;
}

- (void)addNavigationItem
{
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(kScreenWidth - 40, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"my_setting"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickBarButtonItem:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightNav = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightNav;
}

- (void)clickBarButtonItem:(UIButton *)sender
{
    NSLog(@"点了设置");
}

//#pragma mark -- 去掉UItableview headerview黏性
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self.tableView) {
//        CGFloat sectionHeaderHeight = 80;
//        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
//            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
//            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//        }
//    }
//    return;
//}

#pragma mark -- UITableViewDataSource And UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.001;
    }
    else{
        return 5;
    }
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (section==0) {
//    
//        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2)];
//        headerView.backgroundColor = [UIColor redColor];
//        
//        UIImageView *imageView = [UIImageView new];
//        imageView.image = [UIImage imageNamed:@"my_default_head"];
//        [headerView addSubview:imageView];
//        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.centerY.equalTo(headerView.mas_centerY).offset(20.0);
//            make.center.equalTo(headerView).centerOffset(CGPointMake(0, -20));
//            make.size.mas_equalTo(CGSizeMake(60, 60));
//        }];
//        
//        UILabel *userName = [UILabel new];
//        userName.text = @"登录 / 注册";
//        userName.textColor = [UIColor whiteColor];
//        userName.font =  [UIFont fontWithName:@"Helvetica-Bold" size:17];
//        [headerView addSubview:userName];
//        [userName mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.center.equalTo(headerView).centerOffset(CGPointMake(0, 28));
//        }];
//        return headerView;
//    }
//    return nil;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MiddleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MiddleCell"];
        return cell;
    }else {
        UndelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UndelCell"];
        
        if (indexPath.section == 1) {
            cell.isSwitch.hidden = YES;
            [cell cellImage:[UIImage imageNamed:@"my_icon_miandian"] cellTitle:@"面点商城"];
            
        }else if (indexPath.section == 2){
            cell.isSwitch.hidden = YES;
           [cell cellImage:[UIImage imageNamed:self.cellData1[indexPath.row][@"imageName"]] cellTitle:self.cellData1[indexPath.row][@"title"]];
            NSLog(@"----%@",self.cellData1);
            
        }else if (indexPath.section == 3){
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell cellImage:[UIImage imageNamed:self.cellData2[indexPath.row][@"imageName"]] cellTitle:self.cellData2[indexPath.row][@"title"]];
        }else{
            cell.isSwitch.hidden = YES;
            [cell cellImage:[UIImage imageNamed:self.cellData3[indexPath.row][@"imageName"]] cellTitle:self.cellData3[indexPath.row][@"title"]];
        }
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
