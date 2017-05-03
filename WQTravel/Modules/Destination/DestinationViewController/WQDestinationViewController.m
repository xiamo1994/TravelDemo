//
//  WQDestinationViewController.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/18.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQDestinationViewController.h"
#import "WQRightCollectionViewCell.h"
#import "WQDesView.h"
#import <Masonry.h>
#import "WQDestinationProxy.h"

@interface WQDestinationViewController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) WQDesView *desBannerView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *data;

@property (nonatomic, assign) NSInteger areaIndex;

@end

@implementation WQDestinationViewController

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.desBannerView];
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.collectionView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.desBannerView.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.view.bounds.size.width / 5);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tableView);
        make.left.mas_equalTo(self.tableView.mas_right).mas_offset(5);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(self.tableView);
    }];
    
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.collectionView registerClass:[WQRightCollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    WQDestinationProxy *proxy = [[WQDestinationProxy alloc] init];
    self.data = [proxy requestDestinationData];
    
    [self.tableView reloadData];
    [self.collectionView reloadData];
}

#pragma mark - # TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;//2
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WQAreaModel *model = self.data[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    [cell.textLabel setText:model.areaName];
    return cell;
}

//点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.areaIndex = indexPath.row;
    [self.collectionView reloadData];
}


#pragma mark - # CollectionViewDataSource
//每个section的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    WQAreaModel *model = self.data[self.areaIndex];
    return model.cityArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WQAreaModel *model = self.data[self.areaIndex];
    NSString *cityName = model.cityArray[indexPath.row];
    WQRightCollectionViewCell *colCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    colCell.cityLabel.text = cityName;
    
    return colCell;
}


#pragma mark - # CollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = collectionView.frame.size.width * 0.44 - 1;
    return CGSizeMake(width, width);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat space = collectionView.frame.size.width * 0.04;
    return UIEdgeInsetsMake(10, space, 10, space);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat space = collectionView.frame.size.width * 0.04;
    return space;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat space = collectionView.frame.size.width * 0.04;
    return space;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeZero;
}

#pragma mark - # Getter
- (WQDesView *)desBannerView
{
    if (!_desBannerView) {
        _desBannerView = [[WQDesView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    }
    return _desBannerView;

}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
    }
    return _tableView;
}

-(UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        //初始化layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        //设置代理
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
@end
