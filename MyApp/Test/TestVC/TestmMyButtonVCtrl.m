//
//  TestmMyButtonVCtrl.m
//  MyApp
//
//  Created by dudongge on 2018/12/19.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "TestmMyButtonVCtrl.h"
#import "MyButton.h"

@interface TestmMyButtonVCtrl ()
@property (nonatomic, strong) MyButton *myButton;
@property (nonatomic, strong) MyButton *rightButton;
@property (nonatomic, strong) MyButton *topButton;
@property (nonatomic, strong) MyButton *bottomButton;
@property (nonatomic, strong) MyButton *titleColorButton;
@property (nonatomic, strong) MyButton *attButton;
@end


@implementation TestmMyButtonVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.myButton.frame = CGRectMake(20, 100, 120, 40);
    self.myButton.backgroundColor = UIColor.grayColor;
    [self.myButton setImage:[UIImage imageNamed:@"cache_delete"] withState:UIControlStateSelected];
    [self.myButton setImage:[UIImage imageNamed:@"cache_pause"] withState:UIControlStateHighlighted];
    [self.myButton setImage:[UIImage imageNamed:@"cache_cancel_all"] withState:UIControlStateDisabled];
    [self.myButton setTitle:@"选中了" withState:UIControlStateSelected];
    [self.myButton setTitle:@"正在按下..." withState:UIControlStateHighlighted];
    [self.myButton setTitleColor:UIColor.blueColor withState:UIControlStateSelected];
    [self.myButton setTitleColor:UIColor.whiteColor withState:UIControlStateNormal];
    [self.myButton setTitleColor:UIColor.yellowColor withState:UIControlStateHighlighted];
    [self.myButton setTitleColor:UIColor.purpleColor withState:UIControlStateDisabled];
    [self.myButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightButton.frame = CGRectMake(180, 100, 120, 40);
    self.rightButton.backgroundColor = UIColor.grayColor;
    [self.rightButton setImage:[UIImage imageNamed:@"cache_delete"] withState:UIControlStateSelected];
    [self.rightButton setImage:[UIImage imageNamed:@"cache_pause"] withState:UIControlStateHighlighted];
    [self.rightButton setImage:[UIImage imageNamed:@"cache_cancel_all"] withState:UIControlStateDisabled];
    [self.rightButton setTitle:@"选中了" withState:UIControlStateSelected];
    [self.rightButton setTitle:@"正在按下..." withState:UIControlStateHighlighted];
    [self.rightButton setTitleColor:UIColor.blueColor withState:UIControlStateSelected];
    [self.rightButton setTitleColor:UIColor.yellowColor withState:UIControlStateHighlighted];
    [self.rightButton setTitleColor:UIColor.purpleColor withState:UIControlStateDisabled];
    [self.rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.topButton.frame = CGRectMake(20, 180, 120, 70);
    self.topButton.backgroundColor = UIColor.whiteColor;
    [self.topButton setImage:[UIImage imageNamed:@"cache_delete"] withState:UIControlStateSelected];
    [self.topButton setImage:[UIImage imageNamed:@"cache_pause"] withState:UIControlStateHighlighted];
    [self.topButton setImage:[UIImage imageNamed:@"cache_cancel_all"] withState:UIControlStateDisabled];
    [self.topButton setTitle:@"选中了" withState:UIControlStateSelected];
    [self.topButton setTitle:@"正在按下..." withState:UIControlStateHighlighted];
    [self.topButton setTitle:@"不可用" withState:UIControlStateDisabled];
    [self.topButton setTitleColor:UIColor.blueColor withState:UIControlStateSelected];
    [self.topButton setTitleColor:UIColor.yellowColor withState:UIControlStateHighlighted];
    [self.topButton setTitleColor:UIColor.purpleColor withState:UIControlStateDisabled];
    [self.topButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.bottomButton.frame = CGRectMake(180, 180, 160, 80);
    self.bottomButton.backgroundColor = UIColor.lightGrayColor;
    [self.bottomButton setImage:[UIImage imageNamed:@"cache_delete"] withState:UIControlStateSelected];
    [self.bottomButton setImage:[UIImage imageNamed:@"cache_pause"] withState:UIControlStateHighlighted];
    [self.bottomButton setImage:[UIImage imageNamed:@"cache_cancel_all"] withState:UIControlStateDisabled];
    [self.bottomButton setTitle:@"选中了" withState:UIControlStateSelected];
    [self.bottomButton setTitle:@"正在按下..." withState:UIControlStateHighlighted];
    [self.bottomButton setTitle:@"不可用" withState:UIControlStateDisabled];
    [self.bottomButton setTitleColor:UIColor.blueColor withState:UIControlStateSelected];
    [self.bottomButton setTitleColor:UIColor.yellowColor withState:UIControlStateHighlighted];
    [self.bottomButton setTitleColor:UIColor.purpleColor withState:UIControlStateDisabled];
    [self.bottomButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleColorButton.frame = CGRectMake(20, 300, 160, 50);
    self.titleColorButton.backgroundColor = UIColor.lightGrayColor;
    self.titleColorButton.layer.cornerRadius = 5.0;
    
    self.attButton.frame = CGRectMake(200, 300, 160, 50);
    self.attButton.backgroundColor = UIColor.grayColor;
    [self.attButton setImage:[UIImage imageNamed:@"cache_delete"] withState:UIControlStateSelected];
    [self.attButton setImage:[UIImage imageNamed:@"cache_pause"] withState:UIControlStateHighlighted];
    [self.attButton setImage:[UIImage imageNamed:@"cache_cancel_all"] withState:UIControlStateDisabled];
    NSString *yellorAttribute = [NSString stringWithFormat:@"天下风云出我辈"];
    NSRange range = NSMakeRange(2, 2);
    NSMutableAttributedString *astrY = [[NSMutableAttributedString alloc] initWithString:yellorAttribute];
    [astrY setAttributes:@{NSForegroundColorAttributeName : UIColor.yellowColor,
                           NSFontAttributeName : [UIFont systemFontOfSize:24]} range:range];
    NSString *redAttribute = [NSString stringWithFormat:@"天下风云出我辈"];
    NSMutableAttributedString *astrR = [[NSMutableAttributedString alloc] initWithString:redAttribute];
    [astrR setAttributes:@{NSForegroundColorAttributeName : UIColor.redColor,
                           NSFontAttributeName : [UIFont systemFontOfSize:22]} range:range];
    NSString *greenAttribute = [NSString stringWithFormat:@"天下风云出我辈"];
    NSMutableAttributedString *astrG = [[NSMutableAttributedString alloc] initWithString:greenAttribute];
    [astrG setAttributes:@{NSForegroundColorAttributeName : UIColor.greenColor,
                           NSFontAttributeName : [UIFont systemFontOfSize:20]} range:range];
    [self.attButton setTltleAttributes:astrY withState:UIControlStateSelected];
    [self.attButton setTltleAttributes:astrR withState:UIControlStateHighlighted];
    [self.attButton setTltleAttributes:astrG withState:UIControlStateDisabled];
    [self.attButton setBackGroundColor:UIColor.lightGrayColor withState:UIControlStateHighlighted];
    [self.attButton setBackGroundColor:UIColor.blueColor withState:UIControlStateSelected];
    [self.attButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickButton:(MyButton *)button {
    button.selected = !button.selected;
    
}

- (MyButton *)myButton {
    if (!_myButton) {
        _myButton = [[MyButton alloc]initWithImage:[UIImage imageNamed:@"cache_pause"]
                                             title:@"来点我啊"
                                         titleFond:[UIFont systemFontOfSize:14]
                                       imageMargin:10
                                imageAlignmentTYpe:MyButtonImageAlignmentLeft];
        [self.view addSubview:_myButton];
    }
    return _myButton;
}

- (MyButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[MyButton alloc]initWithImage:[UIImage imageNamed:@"cache_pause"]
                                                title:@"下载"
                                            titleFond:[UIFont systemFontOfSize:13]
                                          imageMargin:12
                                   imageAlignmentTYpe:MyButtonImageAlignmentRight];
        [self.view addSubview:_rightButton];
    }
    return _rightButton;
}

- (MyButton *)topButton {
    if (!_topButton) {
        _topButton = [[MyButton alloc]initWithImage:[UIImage imageNamed:@"cache_pause"]
                                              title:@"下载"
                                          titleFond:[UIFont systemFontOfSize:13]
                                        imageMargin:12
                                 imageAlignmentTYpe:MyButtonImageAlignmentTop];
        [self.view addSubview:_topButton];
    }
    return _topButton;
}

- (MyButton *)bottomButton {
    if (!_bottomButton) {
        _bottomButton = [[MyButton alloc]initWithImage:[UIImage imageNamed:@"cache_pause"]
                                                 title:@"下载"
                                             titleFond:[UIFont systemFontOfSize:13]
                                           imageMargin:18
                                    imageAlignmentTYpe:MyButtonImageAlignmentBottom];
        [self.view addSubview:_bottomButton];
    }
    return _bottomButton;
}

- (MyButton *)titleColorButton {
    if (!_titleColorButton) {
        _titleColorButton = [[MyButton alloc]initWithImage:[UIImage imageNamed:@"cache_cancel_all"]
                                                     title:@"彩色"
                                                 titleFond:[UIFont systemFontOfSize:14]
                                                titleColor:[UIColor redColor]
                                               imageMargin:5
                                        imageAlignmentTYpe:MyButtonImageAlignmentLeft];
        [self.view addSubview:_titleColorButton];
    }
    return _titleColorButton;
}

- (MyButton *)attButton {
    if (!_attButton) {
        NSString *needCoinsAttribute = [NSString stringWithFormat:@"天下风云出我辈"];
        NSRange range = NSMakeRange(2, 2);
        NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:needCoinsAttribute];
        [astr setAttributes:@{NSForegroundColorAttributeName : UIColor.purpleColor,
                              NSFontAttributeName : [UIFont systemFontOfSize:20]} range:range];
        
        _attButton = [[MyButton alloc]initWithImage:[UIImage imageNamed:@"cache_cancel_all"]
                                     titleAttribute:astr
                                        imageMargin:5
                                 imageAlignmentTYpe:MyButtonImageAlignmentRight];
        [self.view addSubview:_attButton];
    }
    return _attButton;
}

@end
