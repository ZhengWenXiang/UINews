//
//  LeftMenuViewDemo.m
//  MenuDemo
//
//  Created by Lying on 16/6/12.
//  Copyright © 2016年 Lying. All rights reserved.
//


#import "LeftMenuViewDemo.h"
#import "LeftView.h"

#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSubTileKey @"subTitle"

@interface LeftMenuViewDemo ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic , strong) NSArray *cellData;
@end

@implementation LeftMenuViewDemo

 
-(instancetype)initWithFrame:(CGRect)frame{

    if(self = [super initWithFrame:frame]){
        [self initView];
    }
    return  self;
}

-(void)initView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LeftView class]) bundle:nil] forCellReuseIdentifier:@"LeftView"];
    self.tableView.tableFooterView = [UIView new];
    [self addSubview:self.tableView];
    
   
}
- (NSArray *)cellData
{
    if (!_cellData) {
        _cellData = [NSArray array];
        _cellData = @[
                       @{kTitleKey  : @"界面新闻",
                         kSubTileKey: @"500位CEO鼎力推荐",
                         kImgKey    : @"channel_jm"},
                       
                       @{kTitleKey  : @"摩尔金融",
                         kSubTileKey: @"与投资高手为伍",
                         kImgKey    : @"channel_fbi"},
                       
                       @{kTitleKey  : @"尤物",
                         kSubTileKey: @"原创设计新势力",
                         kImgKey    : @"channel_uw"},
                       
                       @{kTitleKey  : @"前辈",
                         kSubTileKey: @"一对一电话请教",
                         kImgKey    : @"channel_qb"},
                       
                       @{kTitleKey  : @"面点商城",
                         kSubTileKey: @"拿礼拿到停不下来",
                         kImgKey    : @"channel_md"},
                       
                       @{kTitleKey  : @"美丽中国",
                         kSubTileKey: @"发现建造之美",
                         kImgKey    : @"channel_me"},
                       ];
        
    }
    return _cellData;
    
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section == 1){
        return 6;
    }else if (section == 2){
        return 1;
    }else{
        return 4;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return 40;
        }else if (indexPath.row == 3){
            return 75;
        }else{
            return 55;
        }
    }else {
        return 55 ;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"LeftView%li",(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    if (indexPath.section == 0) {
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.bounds.size.width, 30)];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.font = FONT(15);
        contentLabel.text = @"—— 为独立思考人群服务 ——";
        cell.backgroundColor = UIColorFromRGB(0xCDCDCD);
        [cell addSubview:contentLabel];
    }else if (indexPath.section == 1){
        UIView *colorView = [UIView new];
        colorView.backgroundColor = randomColor;
        [cell addSubview:colorView];
        [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(5);
        }];
        
        UIImageView *imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:self.cellData[indexPath.row][@"imageName"]];
        [cell addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(cell).centerOffset(CGPointMake(20, 0));
            make.left.mas_equalTo(40);
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(25);
        }];
        
        UILabel *title = [UILabel new];
        title.text = self.cellData[indexPath.row][@"title"];
        title.font = FONT(15);
        title.textColor = UIColorFromRGB(0x333333);
        [cell addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imgView).with.offset(50);
            make.top.mas_equalTo(9);
            
        }];
        
        UILabel *subTitle = [UILabel new];
        subTitle.text = self.cellData[indexPath.row][@"subTitle"];
        subTitle.textColor = UIColorFromRGB(0x999999);
        subTitle.font = FONT(12);
        [cell addSubview:subTitle];
        [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imgView).with.offset(50);
            make.bottom.mas_equalTo(title).with.offset(20);
            
        }];
    }else if (indexPath.section == 2){
        LeftView *leftView = [self.tableView dequeueReusableCellWithIdentifier:@"LeftView"];
        return leftView;
    }else{
        if (indexPath.row == 0) {
            UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, self.bounds.size.width, 30)];
            contentLabel.textAlignment = NSTextAlignmentCenter;
            //        contentLabel.font = FONT(21);
            contentLabel.text = @"—— 战略合作 ——";
            cell.backgroundColor = UIColorFromRGB(0xCDCDCD);
            [cell addSubview:contentLabel];
        }else if (indexPath.row == 3){
            UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, self.bounds.size.width, 30)];
            contentLabel.textColor = UIColorFromRGB(0x999999);
            contentLabel.font = FONT(12);
            contentLabel.text = @"对战略合作感兴趣？请点击了解详情...";
            [cell addSubview:contentLabel];
        }
        else{
            cell.textLabel.text = @"链家网";
            cell.textLabel.font = FONT(14);

        }
        
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([self.customDelegate respondsToSelector:@selector(LeftMenuViewClick:)]){
        [self.customDelegate LeftMenuViewClick:indexPath.row];
    }
    
}



@end
