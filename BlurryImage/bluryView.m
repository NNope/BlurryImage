//
//  bluryView.m
//  BlurryImage
//
//  Created by 谈Xx on 15/8/25.
//  Copyright (c) 2015年 谈Xx. All rights reserved.
//

#import "bluryView.h"

#define kDefaultHeaderFrame CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)

@implementation bluryView

-(instancetype) initWithbluryImg:(UIImage *)bluryImg andFrame:(CGRect)frame andBluryType:(bluryType)blurytyp
{
    if (self = [super initWithFrame:frame]) {
        
        self.imgView = [[UIImageView alloc] initWithFrame:frame];
        self.imgView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        // 这句不能有
//        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imgView];
        self.blurryImgView = [[UIImageView alloc] initWithFrame:frame];
        self.blurryImgView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.blurryImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.blurryImgView];
        
        self.bluryImg = bluryImg; // 会重写set方法，给图片的时候 就把所有的设置了
        
        if (blurytyp) // 此处设定type，不然外层设置内部属性有问题
            self.bluryType = blurytyp;
    }
    return self;
}

+(instancetype) bluryWithbluryImg:(UIImage *)bluryImg andFrame:(CGRect)frame andBluryType:(bluryType)blurytype
{
    return [[self alloc] initWithbluryImg:bluryImg andFrame:frame andBluryType:blurytype];
}

#pragma mark - 初始化

// 设定图片 默认模糊类别
- (void)setBluryImg:(UIImage *)bluryImg
{
    _bluryImg = bluryImg;
    
    self.imgView.image = bluryImg;
    // 默认模糊模式  透明 会走type的set 然后设置图片 所以不用下面的方法了
    self.bluryType = bluryTypeLight;
    // 默认透明度
    self.bluryAlpha = 1.0;
    
    // 刷新模糊层的图片
    //    [self refreshBlurViewForNewImage];
}

#pragma mark - 模糊设置

-(void)setBluryAlpha:(CGFloat)bluryAlpha
{
    _bluryType = bluryAlpha;
    self.blurryImgView.alpha = bluryAlpha;
}

// 设定自定义的模糊颜色 得到模糊图片
- (void)setBluryColor:(UIColor *)bluryColor
{
    // 得到截屏
    UIImage *screenShot = [self screenShotOfView:self];
    screenShot = [screenShot applyTintEffectWithColor:bluryColor];
    self.blurryImgView.image = screenShot;
}

// 设定type 更新模糊类别 得到模糊图片
- (void)setBluryType:(bluryType)bluryType
{
    _bluryType = bluryType;
    
    // 得到截屏
    UIImage *screenShot = [self screenShotOfView:self];
    // 根据类别 获得模糊图片
    switch (_bluryType)
    {
        case bluryTypeLight:
        {
            screenShot = [screenShot applyLightEffect];
        }
            break;
        case bluryTypeExtraLight:
        {
            screenShot = [screenShot applyExtraLightEffect];
        }
            break;
        case bluryTypeDarkEffect:
        {
            screenShot = [screenShot applyDarkEffect];
        }
            break;
            
        default:
            break;
    }
    
    self.blurryImgView.image = screenShot;
}


#pragma mark - 模糊层截屏

// 得到虚化层截屏  其实也没必要 直接把原始imageView的image拿来用也可以
- (UIImage *)screenShotOfView:(UIView *)view
{
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(kDefaultHeaderFrame.size, YES, 0.0);
    // 将StoryViewController中的界面绘制到ImageContext中去，因为你需要确保选项界面是隐藏状态因此你需要等待屏幕刷新后才能绘制
    // 截屏
    [self drawViewHierarchyInRect:kDefaultHeaderFrame afterScreenUpdates:YES];
    // 返回图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
}



/**
 *  默认透明模糊  不用这个方法了
 */
- (void)refreshBlurViewForNewImage
{
    // 得到截屏
    UIImage *screenShot = [self screenShotOfView:self];
    /**
     *  模糊的速度  模糊层的最终透明度  --默认
     */
    //    screenShot = [screenShot applyBlurWithRadius:30 tintColor:[UIColor colorWithWhite:0.6 alpha:0.2] saturationDeltaFactor:1.0 maskImage:nil];
    
    screenShot = [screenShot applyLightEffect];
    // 虚化层设置图片
    self.blurryImgView.image = screenShot;
}

@end
