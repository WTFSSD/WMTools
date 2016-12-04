//
//  UIImage+Extention.m
//
//  Created by seed on 2016/11/25.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import "UIImage+Extention.h"

@implementation UIImage (Extention)
-(UIImage*)scaleToSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

+(instancetype)imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}


+ (instancetype)imageWithMargin:(CGFloat)margin marginColor:(UIColor *)color image:(UIImage *)image
{
    CGSize size = CGSizeMake(margin * 2 + image.size.width , margin * 2 + image.size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //设置一个大圆作为边框
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    //添加一个小圆
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(margin, margin, image.size.width, image.size.height)];
    
    [path addClip];
    [image drawInRect:CGRectMake(margin, margin, image.size.width, image.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
}



+(UIImage*)screenShot{
    UIView *view = [[[[[UIApplication sharedApplication] windows] objectAtIndex:0] subviews] firstObject];
    CGRect frame = [UIScreen mainScreen].bounds;
    UIGraphicsBeginImageContextWithOptions(frame.size,YES,0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage*)screenShotWithView:(UIView*)view{
    CGRect frame = [UIScreen mainScreen].bounds;
    UIGraphicsBeginImageContextWithOptions(frame.size,YES,0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
