//
//  UIColor+Extention.m
//  ToastDemo
//
//  Created by seed on 2016/11/25.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import "UIColor+Extention.h"

@implementation UIColor (Extention)

+(UIColor*)HexColor:(NSString *)hex{
    NSString *cleanString = [hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if ([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+(UIColor*)RGBColor:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    return [UIColor colorWithRed:red/255.0 green:green/255. blue:blue/255.0 alpha:1];
}

+(UIColor*)RGBColor:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255. blue:blue/255.0 alpha:alpha];
}

+(UIColor*)randColor{
    return [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255. blue:arc4random()%255/255.0 alpha:1];
}

+(UIColor *(^)(int))HexColor{
    return ^(int hexValue){
        return [UIColor HexColor:[NSString stringWithFormat:@"%x",hexValue]];
    };
}

+(UIColor *(^)())RandColor{
    return ^(){
        return UIColor.RGBAColor(arc4random()%255,arc4random()%255,arc4random()%255,1.f);
    };
}

+(UIColor *(^)(int, int, int))RGBColor{
    return ^(int r, int g, int b){
        return UIColor.RGBAColor(r,g,b,1.f);
    };
}

+(UIColor *(^)(int, int, int, float))RGBAColor{
    return ^(int r, int g, int b, float a){
        return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
    };
}




+(UIColor*(^)())white{
    return ^(){
        return UIColor.white_a(1.f);
    };
}
+(UIColor*(^)())black{
    return ^(){
        return UIColor.black_a(1.f);
    };
}
+(UIColor*(^)())red{
    return ^(){
        return UIColor.red_a(1.f);
    };
}
+(UIColor*(^)())green{
    return ^(){
        return UIColor.green_a(1.f);
    };
}
+(UIColor*(^)())blue{
    return ^(){
        return UIColor.blue_a(1.f);
    };
}

+(UIColor *(^)())orange{
    return ^(){
        return UIColor.orange_a(1.f);
    };
}
+(UIColor*(^)(CGFloat alpha))white_a{
    return ^(CGFloat alpha){
        return [UIColor colorWithRed:1 green:1 blue:1 alpha:alpha<0?1:alpha>1?1:alpha];
    };
}
+(UIColor*(^)(CGFloat alpha))black_a{
    return ^(CGFloat alpha){
        return [UIColor colorWithRed:0 green:0 blue:0 alpha:alpha<0?1:alpha>1?1:alpha];
    };
}
+(UIColor*(^)(CGFloat alpha))red_a{
    return ^(CGFloat alpha){
        return [UIColor colorWithRed:0 green:0 blue:0 alpha:alpha<0?1:alpha>1?1:alpha];
    };
}
+(UIColor*(^)(CGFloat alpha))green_a{
    return ^(CGFloat alpha){
        return [UIColor colorWithRed:0 green:0 blue:0 alpha:alpha<0?1:alpha>1?1:alpha];
    };
}
+(UIColor*(^)(CGFloat alpha))blue_a{
    return ^(CGFloat alpha){
        return [UIColor colorWithRed:0 green:0 blue:0 alpha:alpha<0?1:alpha>1?1:alpha];
    };
}
+(UIColor *(^)(CGFloat))orange_a{
    return ^(CGFloat alpha){
        return [UIColor colorWithRed:1 green:0.5 blue:0 alpha:alpha<0?1:alpha>1?1:alpha];
    };
}


@end
