//
//  LLDropDownMenu.m
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/20.
//  Copyright © 2018年 刘安愿. All rights reserved.
//
#define keyWindow [UIApplication sharedApplication].keyWindow
#define bgColor [UIColor blackColor]
#import "LLBaseShowView.h"
@interface LLBaseShowView()

/**
 用来显示内容的容器
 */
@property (nonatomic, weak) UIView *contentView;


@end
@implementation LLBaseShowView
#pragma mark - 懒加载contentview
- (UIView *)contentView{
    if (!_contentView) {
        UIView *contentView = [[UIView alloc] init];
        //只是设置一个初始值
        contentView.centerX = keyWindow.centerX;
        contentView.centerY = keyWindow.centerY;
        contentView.width = 1;
        contentView.height = 1;
        contentView.backgroundColor = [UIColor clearColor];
        contentView.userInteractionEnabled = YES;
        [self addSubview:contentView];
        self.contentView = contentView;
    }
    return _contentView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 清除颜色
        self.backgroundColor = [bgColor colorWithAlphaComponent:0.0];
        
        //添加一个灰色图片
       
    }
    return self;
}
+ (instancetype)menu{
    return [[self alloc] init];
}
#pragma mark -  内容
- (void)setContent:(UIView *)content{
    _content = content;
    
    
    //设置content的尺寸
    content.x = 0;
    content.y = 0;
    
    //设置contentview的尺寸
    self.contentView.width = content.width;
    self.contentView.height = content.height;
    
    //设置contentview的的默认位置
    self.contentView.centerX = keyWindow.centerX;
    self.contentView.centerY = - content.height / 2;
    
    
    //如果外面没有传宽度，给你个固定值
    if (self.contentView.width == 0) {
        self.contentView.width = screen_width - 120;
    }
    //如果外面没有传高度，给你个固定值
    if (self.contentView.height == 0) {
        self.contentView.height = screen_width - 200;
    }
    
    //设置content默认的圆角
    self.content.layer.cornerRadius = 8;
    
    
    //把content添加到contentview上面
    [self.contentView addSubview:content];
    
}
#pragma mark -  内容控制器
- (void)setContentController:(UIViewController *)contentController{
    _contentController = contentController;
    self.content = contentController.view;
    self.content.clipsToBounds = YES;
}
#pragma mark -  内容视图四个角的圆角
- (void)setContentCornerRadius:(CGFloat)contentCornerRadius{
    _contentCornerRadius = contentCornerRadius;
    
    
    self.content.layer.cornerRadius = contentCornerRadius;
}
#pragma mark --- 设置视图进入的方式
- (void)setMenuFrom:(LLDropDownMenuFrom)menuFrom{
    _menuFrom = menuFrom;
    switch (menuFrom) {
        case LLDropDownMenuFromTop:{
            self.contentView.centerX = keyWindow.centerX;
            self.contentView.centerY = - self.content.height / 2;
        }
            break;
        case LLDropDownMenuFromBottom:{
            self.contentView.centerX = keyWindow.centerX;
             self.contentView.centerY = keyWindow.height + self.content.height / 2;
        }
            break;
        case LLDropDownMenuFromLeft:{
            self.contentView.centerX = - self.content.width / 2;
            self.contentView.centerY = keyWindow.centerY;
        }
            break;
        case LLDropDownMenuFromRight:{
            self.contentView.centerX = keyWindow.width + self.content.width / 2;
            self.contentView.centerY = keyWindow.centerY;
        }
        case LLDropDownMenuFromCenter:{
            //设置contentview的尺寸
            self.contentView.alpha = 0;
            self.contentView.centerX = keyWindow.centerX;
            self.contentView.centerY = keyWindow.centerY;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -- 设置背景色的透明度
- (void)setBgAlpha:(CGFloat)bgAlpha{
    _bgAlpha = bgAlpha;
    self.backgroundColor = [bgColor colorWithAlphaComponent:bgAlpha];
}


- (void)showWindowCenter{
    
    
    
    //1、获得最上面的窗口
//    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    //2、添加自己到窗口上
    [keyWindow addSubview:self];
    
    //3、设置尺寸
      self.frame = keyWindow.bounds;
    
    //　4、调整contentview的最终显示的位置的位置(模仿弹簧的效果)
    
    CGFloat del = 30;
    switch (self.menuFrom) {
        case LLDropDownMenuFromTop:{
            [UIView animateWithDuration:0.28 animations:^{
                
            self.backgroundColor = [bgColor colorWithAlphaComponent:self.bgAlpha ? self.bgAlpha:0.3];
            self.contentView.centerX = keyWindow.centerX;
            self.contentView.centerY = keyWindow.centerY + del;
            }];
        }
            break;
        case LLDropDownMenuFromBottom:{
            [UIView animateWithDuration:0.28 animations:^{
                self.backgroundColor = [bgColor colorWithAlphaComponent:self.bgAlpha ? self.bgAlpha:0.3];
            self.contentView.centerX = keyWindow.centerX;
            self.contentView.centerY = keyWindow.centerY - del;
            }];
        }
            break;
        case LLDropDownMenuFromLeft:{
            [UIView animateWithDuration:0.28 animations:^{
                self.backgroundColor = [bgColor colorWithAlphaComponent:self.bgAlpha ? self.bgAlpha:0.3];
            self.contentView.centerX = keyWindow.centerX + del;
            self.contentView.centerY = keyWindow.centerY;
            }];
        }
            break;
        case LLDropDownMenuFromRight:{
            [UIView animateWithDuration:0.28 animations:^{
                self.backgroundColor = [bgColor colorWithAlphaComponent:self.bgAlpha ? self.bgAlpha:0.3];
            self.contentView.centerX = keyWindow.centerX - del;
            self.contentView.centerY = keyWindow.centerY;
            }];
        }
            break;
        case LLDropDownMenuFromCenter:{
            [UIView animateWithDuration:0.28 animations:^{
                self.backgroundColor = [bgColor colorWithAlphaComponent:self.bgAlpha ? self.bgAlpha:0.3];
              
                self.contentView.alpha = 1;
                self.contentView.centerX = keyWindow.centerX;
                self.contentView.centerY = keyWindow.centerY;
            }];
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    if (self.menuFrom != LLDropDownMenuFromCenter) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.28 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.28 animations:^{
                self.contentView.centerX = keyWindow.centerX ;
                self.contentView.centerY = keyWindow.centerY;
            }];
        });
    }
  
   
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }
    

}

- (void)dismiss{
    
    [UIView animateWithDuration:0.28 animations:^{
        //设置背景色的透明度逐渐变小
         self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        switch (self.menuFrom) {
            case LLDropDownMenuFromTop:
                self.contentView.centerY = - self.content.height / 2;
                break;
            case LLDropDownMenuFromBottom:
                self.contentView.centerY = self.height + self.content.height / 2;
                break;
            case LLDropDownMenuFromLeft:
                self.contentView.centerX = - self.content.width / 2;
                self.contentView.centerY = keyWindow.centerY;
                
                break;
            case LLDropDownMenuFromRight:
                self.contentView.centerX = self.width + self.content.width / 2;
                self.contentView.centerY = keyWindow.centerY;
                
                break;
            case LLDropDownMenuFromCenter:
                self.contentView.alpha = 0;
                
                break;
                
            default:
                break;
        }
       
       
    }];
    
    
    
    
  
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
    
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    if (touch.view == self.content) {
        return;
    }
    for (id obj in self.content.subviews) {
        if ([obj isKindOfClass: [UIView class]]) {
            if (touch.view == obj) {
                return;
            }
        }
    }
   
    [self dismiss];
}
@end
