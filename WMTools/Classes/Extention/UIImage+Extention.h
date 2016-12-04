//
//  UIImage+;
//
//  Created by seed on 2016/11/25.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extention)
-(UIImage*)scaleToSize:(CGSize)size;
+(instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  给图片添加指定颜色和宽度的圆形边框
 *  @author WTFSSD
 *  @pram margin CGFloat 边框宽度
 *  @pram color  UIColor* 边框颜色
 *  @pram image  UIImage* 添加的图片
 *  @return UIImage*      更改好的图片
 */
+ (instancetype)imageWithMargin:(CGFloat)margin
                    marginColor:(UIColor *)color
                          image:(UIImage *)image;


+(UIImage*)screenShot;
+(UIImage*)screenShotWithView:(UIView*)view;
@end
