//
//  UIView+Extention.h
//  WMTools
//
//  Created by WTFSSD on 2016/12/4.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extention)



/**获得view的X坐标*/
-(CGFloat)x;
/**获得view的Y坐标*/
-(CGFloat)y;
/**view的中心X坐标*/
-(CGFloat)centerX;
/**获得view的中心Y坐标*/
-(CGFloat)centerY;
/**获得view的宽度*/
-(CGFloat)width;
/**获得view的高度*/
-(CGFloat)height;
/**获得view的大小*/
-(CGSize)size;
/**获得view的左上角坐标*/
-(CGPoint)origin;

/**设置view的X坐标*/
-(void)setX:(CGFloat)x;
/**设置view的Y坐标*/
-(void)setY:(CGFloat)y;
/**设置view的中心X坐标*/
-(void)setCenterX:(CGFloat)centerX;
/**设置view的中心Y坐标*/
-(void)setCenterY:(CGFloat)centerY;
/**设置view的宽度*/
-(void)setWidth:(CGFloat)width;
/**设置view的高度*/
-(void)setHeight:(CGFloat)height;
/**设置view的大小*/
-(void)setSize:(CGSize)size;
/**设置view的左上角坐标*/
-(void)setOrigin:(CGPoint)origin;
@end
