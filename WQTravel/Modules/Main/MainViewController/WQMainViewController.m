//
//  ViewController.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/18.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQMainViewController.h"
#import "WQBannerView.h"
#import "WQMainCell.h"
#import "WQDetailViewController.h"
#import <Masonry.h>

@interface WQMainViewController () <UITableViewDataSource,UITableViewDelegate,WQMainCellDelgate>


@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) WQBannerView *bannerView;

@property (nonatomic, strong) NSMutableArray *data;


@end

@implementation WQMainViewController

- (void)loadView
{
    [super loadView];
    [self.navigationItem setTitle:@"旅游"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] initWithCapacity:10];
    
    for (int i = 0; i < 10; i++) {
        WQMainModel *model = [[WQMainModel alloc] init];
        model.imgName = @"tr01.jpg";
        model.mainTitle = @"北京起止香港转机台湾环岛8天7晚跟团游，港龙国泰航空，含春节团期";
        model.priceTitle = @"￥2280起";
        model.characterTitle = @"超值旅行";
        model.productStateTitle= @"跟团游";
        model.depatureTitle= @"北京出发";
        [self.data addObject:model];
    }
    
    [self.tableView reloadData];
    
}


#pragma mark - # Delegate
//组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//每组的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WQMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"0"];
    if(cell == nil)
    {
        cell = [[WQMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"0"];
    }
    //设置代理
    [cell setDelegate:self];
    
    WQMainModel *model = self.data[indexPath.row];
    [cell setModel:model];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    WQDetailViewController *vc = [[WQDetailViewController alloc] init];
    //push前隐藏tabbar
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
}

//代理方法
- (void)mainCellDidClickPriceButton:(WQMainModel *)model
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:model.mainTitle message:model.priceTitle delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alertView show];
}

#pragma mark - # Getter

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        [_tableView setTableHeaderView:self.bannerView];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        
    }
    return _tableView;
}

- (WQBannerView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[WQBannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    }
    return _bannerView;
}

@end
