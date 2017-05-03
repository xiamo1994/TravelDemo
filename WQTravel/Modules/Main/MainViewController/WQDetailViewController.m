//
//  WQDetailViewController.m
//  WQTravel
//
//  Created by 王倩 on 2017/3/4.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQDetailViewController.h"
#import <Masonry.h>

@interface WQDetailViewController ()

@property (nonatomic, strong) UIImageView *detailImgView;

@property (nonatomic, strong) UILabel *mainTitleLabel;

@property (nonatomic, strong) UILabel *resourceLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation WQDetailViewController

- (void)loadView
{
    [super loadView];
    [self.navigationItem setTitle:@"产品详情"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.detailImgView];
    [self.view addSubview:self.mainTitleLabel];
    [self.view addSubview:self.resourceLabel];
    [self.view addSubview:self.priceLabel];
    
    [self p_addMasonry];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)p_addMasonry
{
    [self.detailImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(270);
    }];
    
    [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.detailImgView.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    
    [self.resourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mainTitleLabel.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.mainTitleLabel);
        make.width.mas_lessThanOrEqualTo(200);
        make.height.mas_equalTo(18);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.resourceLabel.mas_bottom).mas_offset(20);
        make.left.mas_equalTo(self.mainTitleLabel);
        make.width.mas_lessThanOrEqualTo(200);
        make.height.mas_equalTo(20);
    }];
    
}
- (UIImageView *)detailImgView
{
    if (!_detailImgView) {
        _detailImgView = [[UIImageView alloc] init];
        [_detailImgView setImage:[UIImage imageNamed:@"tr01.jpg"]];
    }
    return _detailImgView;
}
- (UILabel *)mainTitleLabel
{
    if (!_mainTitleLabel) {
        _mainTitleLabel = [[UILabel alloc] init];
        [_mainTitleLabel setText:@"北京起止香港转机台湾环岛8天7晚跟团游，港龙国泰航空，含春节团期"];
        [_mainTitleLabel setFont:[UIFont systemFontOfSize:15]];
        [_mainTitleLabel setNumberOfLines:2];
    }
    return _mainTitleLabel;
}
- (UILabel *)resourceLabel
{
    if (!_resourceLabel) {
        _resourceLabel = [[UILabel alloc] init];
        [_resourceLabel setTextColor:[UIColor grayColor]];
        [_resourceLabel setText:@"本产品由北京康辉提供相关服务"];
        [_resourceLabel setFont:[UIFont systemFontOfSize:12]];
    }
    return _resourceLabel;
}
- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        [_priceLabel setTextColor:[UIColor orangeColor]];
        [_priceLabel setText:@"￥2280起"];
        [_priceLabel setFont:[UIFont systemFontOfSize:20]];
    }
    return _priceLabel;
}

@end
