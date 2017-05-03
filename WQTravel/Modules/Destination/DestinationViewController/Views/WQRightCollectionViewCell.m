//
//  WQRightCollectionViewCell.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/21.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQRightCollectionViewCell.h"
#import <Masonry.h>

@implementation WQRightCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.imgView];
        [self.imgView addSubview:self.cityLabel];
         
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imgView).mas_offset(10);
            make.left.mas_equalTo(self.imgView).mas_offset(10);
            make.width.mas_lessThanOrEqualTo(60);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}


- (UIImageView *)imgView
{
    if(!_imgView)
    {
        _imgView = [[UIImageView alloc] init];
        [_imgView setImage:[UIImage imageNamed:@"tr01.jpg"]];
    }
    return _imgView;
}

- (UILabel *)cityLabel
{
    if (!_cityLabel) {
        _cityLabel = [[UILabel alloc] init];
        [_cityLabel setFont:[UIFont systemFontOfSize:14]];
        [_cityLabel setTextColor:[UIColor whiteColor]];
        
    }
    return _cityLabel;
}
@end
