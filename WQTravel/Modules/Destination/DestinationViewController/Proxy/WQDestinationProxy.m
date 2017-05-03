
//
//  WQDestinationProxy.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/22.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "WQDestinationProxy.h"

@implementation WQDestinationProxy

- (NSArray *)requestDestinationData
{
    WQAreaModel *model1 = [WQAreaModel createWithAreaName:@"热门" cityArray:@[@"首尔", @"济州岛", @"大阪", @"东京"]];
    WQAreaModel *model2 = [WQAreaModel createWithAreaName:@"周边" cityArray:@[@"石家庄", @"北京", @"济南", @"天津", @"张家口"]];
    return @[model1, model2];
}

@end
