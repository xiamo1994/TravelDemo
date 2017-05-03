//
//  WQMainCell.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/19.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQMainCell.h"
#import <Masonry.h>

@interface WQMainCell ()

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UIButton *priceButton;

@property (nonatomic, strong) UILabel *mainTitleLabel;

@property (nonatomic, strong) UILabel *characterTitleLabel;

@property (nonatomic, strong) UILabel *productStateTitleLabel;


@end

@implementation WQMainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.imgView];
        [self addSubview:self.mainTitleLabel];
        [self addSubview:self.characterTitleLabel];
        
        [self.imgView addSubview:self.priceButton];
        [self.imgView addSubview:self.productStateTitleLabel];
        
        [self p_addMasonry];
    }
    return self;
}

- (void)setModel:(WQMainModel *)model
{
    _model = model;
    self.imgView.image = [UIImage imageNamed:model.imgName];
    self.mainTitleLabel.text = model.mainTitle;
    self.characterTitleLabel.text = model.characterTitle;
    [self.priceButton setTitle:model.priceTitle forState:UIControlStateNormal];
    NSString *str = [NSString stringWithFormat: @"%@ | %@", model.productStateTitle, model.depatureTitle];
    self.productStateTitleLabel.text = str;
}


- (void)p_addMasonry
{
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        
    }];

    [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(42);
    }];
    
    [self.characterTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mainTitleLabel.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(self.mainTitleLabel);
        make.width.mas_lessThanOrEqualTo(100);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(-10);
    }];
    
    [self.priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.bottom.mas_equalTo(self.imgView.mas_bottom).mas_offset(-10);
        make.width.mas_lessThanOrEqualTo(100);
        make.height.mas_equalTo(30);
    }];
    [self.productStateTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView).mas_offset(10);
        make.left.mas_equalTo(self.imgView).mas_offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
}

#pragma mark - # Events Response
- (void)priceButtonClick
{
    [self.delegate mainCellDidClickPriceButton:self.model];
}

#pragma mark - # Getter
- (UIImageView *)imgView
{
    if(!_imgView)
    {
        _imgView = [[UIImageView alloc] init];
        [_imgView setUserInteractionEnabled:YES];
    }
    return _imgView;
}

- (UIButton *)priceButton
{
    if (!_priceButton) {
        _priceButton = [[UIButton alloc] init];
        [_priceButton setBackgroundColor:[UIColor greenColor]];
        [_priceButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
        //点击事件
        [_priceButton addTarget:self action:@selector(priceButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _priceButton;
}
- (UILabel *)mainTitleLabel
{
    if (!_mainTitleLabel) {
        _mainTitleLabel = [[UILabel alloc] init];
        [_mainTitleLabel setNumberOfLines:2];
        [_mainTitleLabel setFont:[UIFont systemFontOfSize:15]];
    }
    return _mainTitleLabel;
}

- (UILabel *)characterTitleLabel
{
    if (!_characterTitleLabel) {
        _characterTitleLabel = [[UILabel alloc] init];
        [_characterTitleLabel setFont:[UIFont systemFontOfSize:12]];
        _characterTitleLabel.layer.borderWidth = 0.5;
        _characterTitleLabel.layer.borderColor = [[UIColor grayColor]CGColor];
        
    }
    return _characterTitleLabel;
}

- (UILabel *)productStateTitleLabel
{
    if (!_productStateTitleLabel) {
        _productStateTitleLabel = [[UILabel alloc] init];
        [_productStateTitleLabel setFont:[UIFont systemFontOfSize:12]];
        [_productStateTitleLabel setTextColor:[UIColor whiteColor]];
    }
    return _productStateTitleLabel;
}


@end
