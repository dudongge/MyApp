//
//  MyButton.m
//  MyApp
//
//  Created by dudongge on 2018/12/18.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "MyButton.h"


@interface MyButton()

@property (nonatomic, assign) MyButtonImageAlignmentTYpe  imageAlignmentTYpe;
@property (nonatomic, assign) CGFloat imageMargin;

@property (nonatomic, strong) UIImage  *normalImage;
@property (nonatomic, strong) NSString *normalTitle;
@property (nonatomic, strong) UIColor  *normalTitleColor;
@property (nonatomic, strong) UIFont   *normalTitleFond;
@property (nonatomic, strong) UIColor  *normalBackgroundColor;
@property (nonatomic, strong) NSAttributedString  *normalTitleAttribute;

@property (nonatomic, strong) UIImage  *selectedImage;
@property (nonatomic, strong) NSString *selectedTitle;
@property (nonatomic, strong) UIColor  *selectedTitleColor;
@property (nonatomic, strong) UIFont   *selectedTitleFond;
@property (nonatomic, strong) UIColor  *selectedBackgroundColor;
@property (nonatomic, strong) NSAttributedString  *selectedTitleAttribute;

@property (nonatomic, strong) UIImage  *highlightedImage;
@property (nonatomic, strong) NSString *highlightedTitle;
@property (nonatomic, strong) UIColor  *highlightedTitleColor;
@property (nonatomic, strong) UIFont   *highlightedTitleFond;
@property (nonatomic, strong) UIColor  *highlightedBackgroundColor;
@property (nonatomic, strong) NSAttributedString  *highlightedTitleAttribute;

@property (nonatomic, strong) UIImage  *enabledImage;
@property (nonatomic, strong) NSString *enabledTitle;
@property (nonatomic, strong) UIColor  *enabledTitleColor;
@property (nonatomic, strong) UIFont   *enabledTitleFond;
@property (nonatomic, strong) UIColor  *enabledBackgroundColor;
@property (nonatomic, strong) NSAttributedString  *enabledTitleAttribute;

@end


@implementation MyButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         [self _initSubViews];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage  *) image
                        title:(NSString *) title
                    titleFond:(UIFont *)   titleFond
                  imageMargin:(CGFloat)    imageMargin
           imageAlignmentTYpe:(MyButtonImageAlignmentTYpe )imageAlignmentTYpe {
    if (self = [super initWithFrame:CGRectZero]) {
        self.normalImage        = image;
        self.normalTitle        = title;
        self.imageMargin        = imageMargin;
        self.normalTitleFond    = titleFond;
        self.imageAlignmentTYpe = imageAlignmentTYpe;
        [self _initSubViews];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                    titleFond:(UIFont *)titleFond
                   titleColor:(UIColor *)titleColor
                  imageMargin:(CGFloat)imageMargin
           imageAlignmentTYpe:(MyButtonImageAlignmentTYpe)imageAlignmentTYpe {
    if (self = [super initWithFrame:CGRectZero]) {
        self.normalImage        = image;
        self.normalTitle        = title;
        self.imageMargin        = imageMargin;
        self.normalTitleFond    = titleFond;
        self.normalTitleColor   = titleColor;
        self.imageAlignmentTYpe = imageAlignmentTYpe;
        [self _initSubViews];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
               titleAttribute:(NSAttributedString *)titleAttribute
                  imageMargin:(CGFloat)imageMargin
           imageAlignmentTYpe:(MyButtonImageAlignmentTYpe)imageAlignmentTYpe {
    if (self = [super initWithFrame:CGRectZero]) {
        self.normalImage           = image;
        self.normalTitleAttribute  = titleAttribute;
        self.imageMargin           = imageMargin;
        self.imageAlignmentTYpe    = imageAlignmentTYpe;
        [self _initSubViews];
    }
    return self;
}


-(void)dealloc {
    [self removeObserver];
    NSLog(@"dealloc -- MyButton");
}

- (void)_initSubViews {
    if (self.normalTitleAttribute) {
        self.titleLabel.attributedText = self.normalTitleAttribute;
    } else {
        self.titleLabel.text = self.normalTitle;
        self.titleLabel.font = self.normalTitleFond;
        self.titleLabel.textColor = self.normalTitleColor ? self.normalTitleColor : UIColor.blackColor;
    }
    self.imageView.image = self.normalImage;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addObserver];
    [self updateConstraints:self.imageAlignmentTYpe];
}

- (void)updateConstraints:(MyButtonImageAlignmentTYpe ) imageAlignmentTYpe {
    switch (imageAlignmentTYpe) {
        case MyButtonImageAlignmentnomal:
            [self setImageLeftLayoutConstraint];
            break;
        case MyButtonImageAlignmentLeft:
            [self setImageLeftLayoutConstraint];
            break;
        case MyButtonImageAlignmentRight:
            [self setImageRightLayoutConstraint];
            break;
        case MyButtonImageAlignmentTop:
            [self setImageTopLayoutConstraint];
            break;
        case MyButtonImageAlignmentBottom:
            [self setImageBottomLayoutConstraint];
            break;
        default:
            break;
    }
}

//图片居左
- (void)setImageLeftLayoutConstraint {
    CGFloat imageWidth  = self.normalImage.size.width;
    CGFloat titleWidth = [self sizeWithText:self.titleLabel.text font:self.titleLabel.font].width;
    CGFloat imageCenterXMargin = (imageWidth /2.0 - (imageWidth + titleWidth + self.imageMargin) / 2.0);
    //创建Image约束
    NSLayoutConstraint *imageCenterYLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *imageCenterXLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:imageCenterXMargin];
    [self addConstraints:@[imageCenterYLc,imageCenterXLc]];
    //创建title约束
    NSLayoutConstraint *titleCenterYLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *titleLeftLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:self.imageMargin];
     [self addConstraints:@[titleCenterYLc,titleLeftLc]];
}

//图片居右
- (void)setImageRightLayoutConstraint {
    CGFloat imageWidth  = self.normalImage.size.width;
    CGFloat titleWidth = [self sizeWithText:self.titleLabel.text font:self.titleLabel.font].width;
    //创建title约束
    CGFloat titleCenterXMargin = (titleWidth /2.0 - (imageWidth + titleWidth + self.imageMargin) / 2.0);
    NSLayoutConstraint *titleCenterYLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *titleCenterXLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:titleCenterXMargin];
    [self addConstraints:@[titleCenterYLc,titleCenterXLc]];
     //创建Image约束
    NSLayoutConstraint *imageCenterYLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *imageRightLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:(self.imageMargin)];
    [self addConstraints:@[imageCenterYLc,imageRightLc]];
}

//图片居上
- (void)setImageTopLayoutConstraint {
    CGFloat imageHeight = self.normalImage.size.height;
    CGFloat titleHeight = [self sizeWithText:self.titleLabel.text font:self.titleLabel.font].height;
    CGFloat imageCenterYMargin = (imageHeight /2.0 - (imageHeight + titleHeight + self.imageMargin) / 2.0);
    //创建Image约束
    NSLayoutConstraint *imageCenterYLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:imageCenterYMargin];
    NSLayoutConstraint *imageCenterXLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self addConstraints:@[imageCenterYLc,imageCenterXLc]];
    //创建title居中约束
    NSLayoutConstraint *titleCenterXLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *titleTopLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:(self.imageMargin)];
     [self addConstraints:@[titleCenterXLc,titleTopLc]];
}

//图片居下
- (void)setImageBottomLayoutConstraint {
    CGFloat imageHeight = self.normalImage.size.height;
    CGFloat titleHeight = [self sizeWithText:self.titleLabel.text font:self.titleLabel.font].height;
    CGFloat titleCenterYMargin = (titleHeight /2.0  - (imageHeight + titleHeight + self.imageMargin) / 2.0 );
    //创建title约束
    NSLayoutConstraint *titleCenterXLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *titleCenterYLc = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:titleCenterYMargin];
    [self addConstraints:@[titleCenterXLc,titleCenterYLc]];
    //创建Image约束
    NSLayoutConstraint *imageCenterYLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:self.imageMargin];
    NSLayoutConstraint *imageCenterXLc = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self addConstraints:@[imageCenterYLc,imageCenterXLc]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (!self.normalBackgroundColor) {
        self.normalBackgroundColor = self.backgroundColor;
    }
    if ([keyPath isEqualToString:@"enabled"]) {
        if(self.enabled) {
            self.imageView.image           = self.enabledImage ? self.enabledImage : self.normalImage;
            self.backgroundColor           = self.enabledBackgroundColor ? self.enabledBackgroundColor : self.normalBackgroundColor;
            if (!self.enabledTitleAttribute) {
                self.titleLabel.text       = self.enabledTitle ? self.enabledTitle : self.normalTitle;
                self.titleLabel.textColor  = self.enabledTitleColor ? self.enabledTitleColor : self.normalTitleColor;
                return;
            }
            self.titleLabel.attributedText = self.enabledTitleAttribute;
        } else {
            self.imageView.image           = self.normalImage;
            self.backgroundColor           = self.normalBackgroundColor;
            if (!self.normalTitleAttribute) {
                self.titleLabel.text       = self.normalTitle;
                self.titleLabel.textColor  = self.normalTitleColor;
                return;
            }
            self.titleLabel.attributedText = self.normalTitleAttribute;
        }
    } else if ([keyPath isEqualToString:@"selected"]) {
        if(self.selected) {
            self.imageView.image           = self.selectedImage ? self.selectedImage : self.normalImage;
            self.backgroundColor           = self.selectedBackgroundColor  ? self.selectedBackgroundColor : self.normalBackgroundColor;
            if (!self.selectedTitleAttribute && !self.normalTitleAttribute) {
                self.titleLabel.text       = self.selectedTitle ? self.selectedTitle : self.normalTitle;
                self.titleLabel.textColor  = self.selectedTitleColor ? self.selectedTitleColor : self.normalTitleColor;
                return;
            }
            self.titleLabel.attributedText = self.selectedTitleAttribute ? self.selectedTitleAttribute : self.normalTitleAttribute;
        } else {
            self.imageView.image           = self.normalImage;
            self.backgroundColor           = self.normalBackgroundColor;
            if (!self.normalTitleAttribute) {
                self.titleLabel.text       = self.normalTitle;
                self.titleLabel.textColor  = self.normalTitleColor;
                return;
            }
            self.titleLabel.attributedText = self.normalTitleAttribute;
        }
    } else if ([keyPath isEqualToString:@"highlighted"]) {
        if(self.highlighted) {
            self.imageView.image          = self.highlightedImage ? self.highlightedImage : self.normalImage;
            self.backgroundColor          = self.highlightedBackgroundColor  ? self.highlightedBackgroundColor : self.normalBackgroundColor;
            if (!self.highlightedTitleAttribute &&  !self.normalTitleAttribute) {
                self.titleLabel.text      = self.highlightedTitle  ? self.highlightedTitle : self.normalTitle;
                self.titleLabel.textColor = self.highlightedTitleColor  ? self.highlightedTitleColor : self.normalTitleColor;
                return;
            }
            self.titleLabel.attributedText= self.highlightedTitleAttribute ? self.highlightedTitleAttribute : self.normalTitleAttribute;
        } else {

        }
    }
    
    if ([keyPath isEqualToString:@"text"]) {
        [self removeConstraints:self.constraints];
        [self.superview layoutIfNeeded];
        [self updateConstraints:self.imageAlignmentTYpe];
        [self.superview layoutIfNeeded];
    }
}

- (void)setImage:(UIImage *)image  withState:(UIControlState)myState {
    switch (myState) {
        case UIControlStateNormal:
            self.normalImage = image;
            break;
        case UIControlStateHighlighted:
            self.highlightedImage = image;
            break;
        case UIControlStateDisabled:
            self.enabledImage = image;
            break;
        case UIControlStateSelected:
            self.selectedImage = image;
            break;
        default:
            break;
    }
}

- (void)setTitle:(NSString *)title  withState:(UIControlState)myState {
    switch (myState) {
        case UIControlStateNormal:
            self.normalTitle = title;
            break;
        case UIControlStateHighlighted:
            self.highlightedTitle = title;
            break;
        case UIControlStateDisabled:
            self.enabledTitle = title;
            break;
        case UIControlStateSelected:
            self.selectedTitle = title;
            break;
        default:
            break;
    }
}

- (void)setTitleColor:(UIColor *)color  withState:(UIControlState)myState {
    switch (myState) {
        case UIControlStateNormal:
            self.normalTitleColor = color;
            break;
        case UIControlStateHighlighted:
            self.highlightedTitleColor = color;
            break;
        case UIControlStateDisabled:
            self.enabledTitleColor = color;
            break;
        case UIControlStateSelected:
            self.selectedTitleColor = color;
            break;
        default:
            break;
    }
}

- (void)setBackGroundColor:(UIColor *)color  withState:(UIControlState)myState {
    switch (myState) {
        case UIControlStateNormal:
            self.normalBackgroundColor = color;
            break;
        case UIControlStateHighlighted:
            self.highlightedBackgroundColor = color;
            break;
        case UIControlStateDisabled:
            self.enabledBackgroundColor = color;
            break;
        case UIControlStateSelected:
            self.selectedBackgroundColor = color;
            break;
        default:
            break;
    }
    
}

- (void)setTltleAttributes:(NSAttributedString *)attributedText withState:(UIControlState)myState {
    switch (myState) {
        case UIControlStateNormal:
            self.normalTitleAttribute = attributedText;
            break;
        case UIControlStateHighlighted:
            self.highlightedTitleAttribute = attributedText;
            break;
        case UIControlStateDisabled:
            self.enabledTitleAttribute = attributedText;
            break;
        case UIControlStateSelected:
            self.selectedTitleAttribute = attributedText;
            break;
        default:
            break;
    }
}

//获取文字的宽高
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [super addTarget:target action:action forControlEvents:controlEvents];
    if (self.myButtonBlock) {
        self.myButtonBlock(self);
    }
}

- (void)addObserver {
    [self addObserver:self
           forKeyPath:@"enabled"
              options: NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:@"selected"
              options: NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:@"highlighted"
              options: NSKeyValueObservingOptionNew
              context:nil];
    [self.titleLabel addObserver:self
                      forKeyPath:@"text"
                         options:NSKeyValueObservingOptionNew
                         context:nil];
}

- (void)removeObserver {
    [self removeObserver:self forKeyPath:@"enabled"];
    [self removeObserver:self forKeyPath:@"selected"];
    [self removeObserver:self forKeyPath:@"highlighted"];
    [self.titleLabel removeObserver:self forKeyPath:@"text"];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        [self addSubview:_imageView];
    }
    return _imageView;
}


@end
