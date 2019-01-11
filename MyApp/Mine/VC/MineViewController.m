//
//  MineViewController.m
//  MyApp
//
//  Created by dudongge on 2018/12/19.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "MineViewController.h"
#import "DDGBannerScrollView.h"
#import "UIColor+MyExtension.h"
#import "DDGHorizontalPageControl.h"
#import "DDGAnimationPageControl.h"
#import "AFNetworking.h"
#import "WeatherInfo.h"
#import "CatalogueListAppModel.h"


@interface MineViewController ()<DDGBannerScrollViewDelegate>

@property (nonatomic, strong) DDGBannerScrollView *bannerScrollView;
@property (nonatomic, strong) DDGBannerScrollView *midBannerScrollView;
@property (nonatomic, strong) UIView *bgHeaderView;
@property (nonatomic, strong) UIView *midHeaderView;
@property (nonatomic, strong) UIView *bgRotationView;
@property (nonatomic, strong) NSMutableArray *changeColors;
@property (nonatomic, strong) NSMutableArray *midChangeColors;
@property (nonatomic, strong) DDGHorizontalPageControl *horizontalPageControl;
@property (nonatomic, strong) DDGAnimationPageControl *animationPageControl;
@property (nonatomic, strong) DDGAnimationPageControl *myAnimationJumpControl;
@property (nonatomic, strong) DDGAnimationPageControl *myAnimationRotationControl;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview: self.bgRotationView];
    
    [self.view addSubview:self.bgHeaderView];
    [self.bgHeaderView addSubview:self.bannerScrollView];
    self.bannerScrollView.pageControlAliment = DDGBannerScrollViewPageContolAlimentRight;
    self.bannerScrollView.pageControlStyle = DDGBannerScrollViewPageImageJump;
    self.bannerScrollView.pageDotImage = [UIImage imageNamed:@"page_normal"];
    self.bannerScrollView.currentPageDotImage = [UIImage imageNamed:@"page_current"];
    self.bannerScrollView.pageDotColor = UIColor.greenColor;
    self.bannerScrollView.currentPageDotColor = UIColor.redColor;
    
   
    [self.bgRotationView addSubview: self.horizontalPageControl];
    [self.bgRotationView addSubview: self.animationPageControl];
    [self.bgRotationView addSubview: self.myAnimationJumpControl];
    [self.bgRotationView addSubview: self.myAnimationRotationControl];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self) return;
//        [self.view addSubview:self.midHeaderView];
//        [self.midHeaderView addSubview: self.midBannerScrollView];
//        self.midBannerScrollView.pageControlAliment = DDGBannerScrollViewPageContolAlimentRight;
//        self.midBannerScrollView.pageControlStyle = DDGBannerScrollViewPageImageAnimated;
//        self.midBannerScrollView.pageDotImage = [UIImage imageNamed:@"page_normal"];
//        self.midBannerScrollView.currentPageDotImage = [UIImage imageNamed:@"page_current"];
    });
    
    
    __weak typeof(self) weakSelf = self;;
    self.bannerScrollView.cycleScrollViewBlock = ^(NSInteger offset) {
        [weakSelf handelBannerBgColorWithOffset:offset];
    };
    
    self.midBannerScrollView.cycleScrollViewBlock = ^(NSInteger offset) {
        [weakSelf handelMidBannerBgColorWithOffset:offset];
    };
    
    [self testnet];
    
}

- (void)testnet {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json",nil];
    [manager GET:@"http://www.weather.com.cn/data/sk/101010100.html" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@", responseObject);
        WeatherInfo *weather = [WeatherInfo yy_modelWithDictionary:responseObject[@"weatherinfo"]];
        NSLog(@"%@", weather.city);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
//    [manager GET:@"https://api.apiopen.top/searchAuthors" parameters:@{@"name":@"李白"} headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//        //WeatherInfo *weather = [WeatherInfo yy_modelWithDictionary:responseObject[@"weatherinfo"]];
//        //NSLog(@"%@", weather.city);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    
    [manager POST:@"http://rap2api.taobao.org/app/mock/24982/catalogueList" parameters:@{@"courseIdBODY":@"1"} headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
         CatalogueListAppModel *mode = [CatalogueListAppModel yy_modelWithDictionary:responseObject[@"data"]];
      
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)cycleScrollView:(DDGBannerScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    [self.horizontalPageControl setCurrentPage:index];
    [self.animationPageControl setCurrentPage:index];
    [self.myAnimationJumpControl setCurrentPage:index];
    [self.myAnimationRotationControl setCurrentPage:index];
}

//根据偏移量计算设置banner背景颜色
- (void)handelBannerBgColorWithOffset:(NSInteger )offset {
    if (1 == self.changeColors.count) return;
    NSInteger offsetCurrent = offset % (int)self.bannerScrollView.bounds.size.width ;
    float rate = offsetCurrent / self.bannerScrollView.bounds.size.width ;
    NSInteger currentPage = offset / (int)self.bannerScrollView.bounds.size.width;
    UIColor *startPageColor;
    UIColor *endPageColor;
    if (currentPage == self.changeColors.count - 1) {
        startPageColor = self.changeColors[currentPage];
        endPageColor = self.changeColors[0];
    } else {
        if (currentPage  == self.changeColors.count) {
            return;
        }
        startPageColor = self.changeColors[currentPage];
        endPageColor = self.changeColors[currentPage + 1];
    }
    UIColor *currentToLastColor = [UIColor getColorWithColor:startPageColor andCoe:rate andEndColor:endPageColor];
    self.bgHeaderView.backgroundColor = currentToLastColor;
}

//根据偏移量计算设置banner背景颜色
- (void)handelMidBannerBgColorWithOffset:(NSInteger )offset {
    if (1 == self.midChangeColors.count) return;
    NSInteger offsetCurrent = offset % (int)self.midBannerScrollView.bounds.size.width ;
    float rate = offsetCurrent / self.midBannerScrollView.bounds.size.width ;
    NSInteger currentPage = offset / (int)self.midBannerScrollView.bounds.size.width;
    UIColor *midStartPageColor;
    UIColor *midEndPageColor;
    if (currentPage == self.midChangeColors.count - 1) {
        midStartPageColor = self.midChangeColors[currentPage];
        midEndPageColor = self.midChangeColors[0];
    } else {
        if (currentPage  == self.midChangeColors.count) {
            return;
        }
        midStartPageColor = self.midChangeColors[currentPage];
        midEndPageColor = self.midChangeColors[currentPage + 1];
    }
    UIColor *midCurrentToLastColor = [UIColor getColorWithColor:midStartPageColor andCoe:rate andEndColor:midEndPageColor];
    self.midHeaderView.backgroundColor = midCurrentToLastColor;
}

- (DDGBannerScrollView *)bannerScrollView {
    if (!_bannerScrollView) {
        CGRect frame = CGRectMake(30, 88, screen_width - 60, screen_width * 0.37);
        _bannerScrollView = [DDGBannerScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"cache_cancel_all"]];
        _bannerScrollView.imageURLStringsGroup = @[@"3",@"1",@"2",@"1",@"2"];
    }
    return _bannerScrollView;
}

- (DDGBannerScrollView *)midBannerScrollView {
    if (!_midBannerScrollView) {
        
        CGRect frame = CGRectMake(30, 88, screen_width - 60, screen_width * 0.37);
        _midBannerScrollView = [DDGBannerScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"cache_cancel_all"]];
        _midBannerScrollView.imageURLStringsGroup = @[@"2",@"0",@"1",@"12",@"11"];
    }
    return _midBannerScrollView;
}

- (UIView *)bgHeaderView {
    if (!_bgHeaderView) {
        _bgHeaderView = [[UIView alloc]init];
       _bgHeaderView.frame = CGRectMake(0,0, screen_width , screen_width * 0.37 + 120);
    }
    return _bgHeaderView;
}

- (UIView *)midHeaderView {
    if (!_midHeaderView) {
        _midHeaderView = [[UIView alloc]init];
        _midHeaderView.frame = CGRectMake(0,screen_width * 0.37 + 130, screen_width, screen_width * 0.37 + 120);
    }
    return _midHeaderView;
}

- (NSMutableArray *)changeColors {
    if (!_changeColors) {
        UIColor *oneColor   = [UIColor colorWithHexString:@"#FDC0BC" alpha:1.0];
        UIColor *twoColor   = [UIColor colorWithHexString:@"#CBC1FF" alpha:1.0];
        UIColor *threeColor = [UIColor colorWithHexString:@"#C8CFA2" alpha:1.0];
        UIColor *fourColor  = [UIColor colorWithHexString:@"#CBC1FF" alpha:1.0];
        UIColor *fiveColor  = [UIColor colorWithHexString:@"#C8CFA2" alpha:1.0];
        _changeColors = [[NSMutableArray alloc]initWithArray:@[oneColor,twoColor,threeColor,fourColor,fiveColor]];
    }
    return _changeColors;
}

- (NSMutableArray *)midChangeColors {
    if (!_midChangeColors) {
        UIColor *oneColor   = [UIColor colorWithHexString:@"#FD12BC" alpha:1.0];
        UIColor *twoColor   = [UIColor colorWithHexString:@"#1BC1FF" alpha:1.0];
        UIColor *threeColor = [UIColor colorWithHexString:@"#C82FA2" alpha:1.0];
        UIColor *fourColor  = [UIColor colorWithHexString:@"#4BC1FF" alpha:1.0];
        UIColor *fiveColor  = [UIColor colorWithHexString:@"#58C4A2" alpha:1.0];
        _midChangeColors = [[NSMutableArray alloc]initWithArray:@[oneColor,twoColor,threeColor,fourColor,fiveColor]];
    }
    return _midChangeColors;
}

- (DDGHorizontalPageControl *)horizontalPageControl {
    if (!_horizontalPageControl) {
        _horizontalPageControl = [[DDGHorizontalPageControl alloc]init];
        _horizontalPageControl.frame = CGRectMake(10, 10, 360, 50);
        _horizontalPageControl.backgroundColor = UIColor.lightGrayColor;
        _horizontalPageControl.currentPageColor = [UIColor whiteColor];
        _horizontalPageControl.normalPageColor = [UIColor grayColor];
        _horizontalPageControl.dotBigSize = CGSizeMake(60, 20);
        _horizontalPageControl.dotNomalSize = CGSizeMake(20, 20);
        _horizontalPageControl.dotMargin = 20;
        _horizontalPageControl.pages = 5;
    }
    return _horizontalPageControl;
}

- (DDGAnimationPageControl *)animationPageControl {
    if (!_animationPageControl) {
        _animationPageControl = [DDGAnimationPageControl initWithinitWithFrame:CGRectMake(10, 80, 360, 50)
                                                                            dotBigSize:CGSizeMake(30, 30)
                                                                          dotNomalSize:CGSizeMake(20, 20)
                                                                             dotMargin:20
                                                                             pageCount:5
                                                                             startPage:1
                                                                      currentPageImage:[UIImage imageNamed:@"page_current"]
                                                                       normalPageImage:[UIImage imageNamed:@"page_normal"]];
    }
    return _animationPageControl;
}

- (DDGAnimationPageControl *)myAnimationRotationControl {
    if (!_myAnimationRotationControl) {
        _myAnimationRotationControl = [DDGAnimationPageControl initWithinitWithFrame:CGRectMake(10, 150, 360, 50)
                                                                     dotBigSize:CGSizeMake(30, 30)
                                                                   dotNomalSize:CGSizeMake(20, 20)
                                                                      dotMargin:20
                                                                      pageCount:5
                                                                      startPage:1
                                                               currentPageImage:[UIImage imageNamed:@"page_current"]
                                                                normalPageImage:[UIImage imageNamed:@"page_normal"]];
        _myAnimationRotationControl.animationType = DDGAnimationPageControlRotation;
    }
    return _myAnimationRotationControl;
}

- (DDGAnimationPageControl *)myAnimationJumpControl {
    if (!_myAnimationJumpControl) {
        _myAnimationJumpControl = [DDGAnimationPageControl initWithinitWithFrame:CGRectMake(10, 220, 360, 50)
                                                                         dotBigSize:CGSizeMake(30, 30)
                                                                       dotNomalSize:CGSizeMake(20, 20)
                                                                          dotMargin:20
                                                                          pageCount:5
                                                                          startPage:1
                                                                   currentPageImage:[UIImage imageNamed:@"page_current"]
                                                                    normalPageImage:[UIImage imageNamed:@"page_normal"]];
        
        _myAnimationJumpControl.animationType = DDGAnimationPageControlJump;
    }
    return _myAnimationJumpControl;
}

- (UIView *)bgRotationView {
    if (!_bgRotationView) {
        _bgRotationView = [[UIView alloc]init];
        _bgRotationView.frame = CGRectMake(10, 300, 360, 380);
        _bgRotationView.backgroundColor = UIColor.lightGrayColor;
    }
    return _bgRotationView;
}

@end
