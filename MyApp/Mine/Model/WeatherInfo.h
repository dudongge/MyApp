//
//  WeatherInfo.h
//  MyApp
//
//  Created by dudongge on 2019/1/11.
//  Copyright © 2019 dudongge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WeatherInfo : NSObject

@property(nonatomic, copy) NSString *city;
@property(nonatomic, copy) NSString *cityid;
@property(nonatomic, copy) NSString *temp;
@property(nonatomic, copy) NSString *WD;
@property(nonatomic, copy) NSString *WS;
@property(nonatomic, copy) NSString *SD;
@property(nonatomic, copy) NSString *WSE;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *isRadar;
@property(nonatomic, copy) NSString *Radar;
@property(nonatomic, copy) NSString *njd;
@property(nonatomic, copy) NSString *qy;
@property(nonatomic, copy) NSString *rain;

@end

NS_ASSUME_NONNULL_END
