//
//  bluryView.h
//  BlurryImage
//
//  Created by 谈Xx on 15/8/25.
//  Copyright (c) 2015年 谈Xx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"
/**
*  模糊类型
*/
typedef enum{
    /**
     *  默认透明
     */
    bluryTypeLight = 0,
    /**
     *  白色模糊
     */
    bluryTypeExtraLight = 1,
    /**
     *  黑色模糊
     */
    bluryTypeDarkEffect = 1 << 1,
}bluryType;


@interface bluryView : UIView

/**
 *  原始ImgView
 */
@property (nonatomic, strong) UIImageView  *imgView;
/**
 *  模糊ImgView
 */
@property (nonatomic, strong) UIImageView  *blurryImgView;


/**
 *  图片
 */
@property (nonatomic, strong) UIImage  *bluryImg;

// 设置项 ==============  颜色和模式 选择一种即可

/**
 *  模糊层的颜色  自定义颜色
 */
@property (nonatomic, strong) UIColor  *bluryColor;
/**
 *  模糊模式  透明 白色 黑色
 */
@property (nonatomic, assign) bluryType  bluryType;
/**
 *  透明度
 */
@property (nonatomic, assign) CGFloat  bluryAlpha;


-(instancetype) initWithbluryImg:(UIImage *)bluryImg andFrame:(CGRect)frame andBluryType:(bluryType)blurytyp;
+(instancetype) bluryWithbluryImg:(UIImage *)bluryImg andFrame:(CGRect)frame andBluryType:(bluryType)blurytype;
@end
