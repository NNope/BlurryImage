//
//  UIImage+ImageEffects.h
//  Inkling
//
//  Created by Aaron Pang on 3/26/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)

/**
 *  根据颜色返回图片
 *
 *  @param color
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  这个太丑了 Radius:3
 *
 *  @return <#return value description#>
 */
- (UIImage *)applySubtleEffect;

/**
 *  透明模糊
 *
 *  @return <#return value description#>
 */
- (UIImage *)applyLightEffect;

/**
 *  白色模糊
 *
 *  @return <#return value description#>
 */
- (UIImage *)applyExtraLightEffect;

/**
 *  黑色模糊
 *
 *  @return <#return value description#>
 */
- (UIImage *)applyDarkEffect;

/**
 *  指定颜色模糊
 *
 *  @param tintColor 模糊背景色
 *
 *  @return <#return value description#>
 */
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;


- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
