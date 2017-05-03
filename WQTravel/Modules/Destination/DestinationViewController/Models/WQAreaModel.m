//
//  WQAreaModel.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/22.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQAreaModel.h"

@implementation WQAreaModel

+ (WQAreaModel *)createWithAreaName:(NSString *)areaName cityArray:(NSArray *)cityArray
{
    WQAreaModel *model = [[WQAreaModel alloc] init];
    model.areaName = areaName;
    model.cityArray = cityArray;
    return model;
}

@end
