//
//  UIColor+Extention.h
//
//  Created by seed on 2016/11/25.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HexColor(aHexValue) UIColor.HexColor(aHexValue)

#define RGBColor(r,g,b) UIColor.RGBColor(r,g,b)


@interface UIColor (Extention)
+(UIColor*)HexColor:(NSString *)hex;
+(UIColor*)RGBColor:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+(UIColor*)RGBColor:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+(UIColor*)randColor;


+(UIColor*(^)(int hexValue))HexColor;
+(UIColor*(^)(int r,int g,int b,float a))RGBAColor;
+(UIColor*(^)(int r,int g,int b))RGBColor;
+(UIColor*(^)())RandColor;

+(UIColor*(^)())white;
+(UIColor*(^)())black;
+(UIColor*(^)())red;
+(UIColor*(^)())green;
+(UIColor*(^)())blue;
+(UIColor*(^)())orange;

+(UIColor*(^)(CGFloat alpha))white_a;
+(UIColor*(^)(CGFloat alpha))black_a;
+(UIColor*(^)(CGFloat alpha))red_a;
+(UIColor*(^)(CGFloat alpha))green_a;
+(UIColor*(^)(CGFloat alpha))blue_a;
+(UIColor*(^)(CGFloat alpha))orange_a;
@end
