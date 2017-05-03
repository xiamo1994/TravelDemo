//
//  WQAreaModel.h
//  WQTravel
//
//  Created by 王倩 on 2017/2/22.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQAreaModel : NSObject

@property (nonatomic, strong) NSString *areaName;

@property (nonatomic, strong) NSArray *cityArray;

+ (WQAreaModel *)createWithAreaName:(NSString *)areaName cityArray:(NSArray *)cityArray;

@end
