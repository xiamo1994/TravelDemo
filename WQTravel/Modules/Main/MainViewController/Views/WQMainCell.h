//
//  WQMainCell.h
//  WQTravel
//
//  Created by 王倩 on 2017/2/19.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQMainModel.h"

@class WQMainCell;
@protocol WQMainCellDelgate <NSObject>

- (void)mainCellDidClickPriceButton:(WQMainModel *)model;

@end

@interface WQMainCell : UITableViewCell
//遵循协议的一个代理变量定义
@property (nonatomic, weak) id<WQMainCellDelgate> delegate;

@property (nonatomic,strong) WQMainModel *model;

@end
