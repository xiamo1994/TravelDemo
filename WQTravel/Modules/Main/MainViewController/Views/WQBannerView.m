//
//  WQBannerView.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/19.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQBannerView.h"
#import "Masonry.h"

@interface WQBannerView ()


@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation WQBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setClipsToBounds:YES];
        [self addSubview:self.imageView];
        
        [self p_addMasonry];
    }
    return self;
}

#pragma mark - # Private Methods
- (void)p_addMasonry
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    
    
}

#pragma mark - # Getter
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:[UIImage imageNamed:@"banner.jpg"]];
    }
    return _imageView;
}

@end
