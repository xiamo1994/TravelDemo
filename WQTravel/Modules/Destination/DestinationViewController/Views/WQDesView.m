//
//  WQDesView.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/21.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQDesView.h"
#import "Masonry.h"

@interface WQDesView ()

@property (nonatomic, strong) UIImageView *desImgView;

@property (nonatomic, strong) UISearchBar *searchBar;

@end
@implementation WQDesView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addSubview:self.desImgView];
        
        [self.desImgView addSubview:self.searchBar];
        [self p_addMasonry];
    }
    return self;
}


#pragma mark - # Private Methods
- (void)p_addMasonry
{
    [self.desImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.desImgView.mas_top).mas_offset(100);
        make.left.mas_equalTo(self.desImgView.mas_left).mas_offset(80);
        make.right.mas_equalTo(self.desImgView.mas_right).mas_offset(-80);
        make.height.mas_equalTo(30);
    
    }];
    
}

#pragma mark - # Getter
- (UIImageView *)desImgView
{
    if (!_desImgView) {
        _desImgView = [[UIImageView alloc] init];
        [_desImgView setImage:[UIImage imageNamed:@"desBanner.jpg"]];
    }
    return _desImgView;
}

- (UISearchBar *)searchBar
{
    if(!_searchBar)
    {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"下一站去哪里？";
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.layer.borderWidth = 0.5;
        _searchBar.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _searchBar;
}
@end

