//
//  WeatherInfo.m
//  MyApp
//
//  Created by dudongge on 2019/1/11.
//  Copyright © 2019 dudongge. All rights reserved.
//

#import "WeatherInfo.h"

@implementation WeatherInfo
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"windDirection" : @"WD"};
}

@end
