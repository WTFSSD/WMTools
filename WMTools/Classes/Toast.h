//
//  Toast.h
//  ToastDemo
//  Created by WTFSSD on 2016/11/23.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#ifndef ScreenWidth
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#endif

#ifndef ScreenHeight
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#endif

typedef NS_ENUM(NSUInteger, AnimationType) {
    /**淡入淡出*/
    AnimationTypeFade       = 1<<0,
    /**移动 上到下*/
    AnimationTypeMoveUTD    = 1<<1,
    /**移动 下到上*/
    AnimationTypeMoveDTU    = 1<<2,
    /**移动 左到右*/
    AnimationTypeMoveLTR    = 1<<3,
    /**移动 右到左*/
    AnimationTypeMoveRTL    = 1<<4,
    
    AnimationTypeDefault    = AnimationTypeFade,
    
};

@interface Toast : NSObject


@property(nonatomic,assign,readonly)NSTimeInterval duration;

@property(nonatomic,strong,readonly)UIColor * textColor;

@property(nonatomic,strong,readonly)UIColor * backgroundColor;

@property(nonatomic,assign,readonly)CGFloat  textFontSize;

@property(nonatomic,assign,readonly)AnimationType aType;
+(instancetype)toast;
/**函数式思想*/
+(void)makeToast:(void(^)(Toast* toast))block;
/***OC链式语法调用****/

/**OC链式语法调用 设置提醒消息*/
-(Toast*(^)(NSString * msg))setMsg;

/**OC链式语法调用 设置显示时间*/
-(Toast*(^)(NSTimeInterval duration))hiddenAfter;

/**OC链式语法调用 设置消息字体大小*/
-(Toast*(^)(CGFloat fontSize))setFontSize;

/**OC链式语法调用 设置提醒字体颜色*/
-(Toast*(^)(UIColor * textColor))setTextColor;

/**OC链式语法调用 设置提醒消息背景颜色*/
-(Toast*(^)(UIColor * textColor))setBackgroundColor;

/**OC链式语法调用 设置提醒消息 距离屏幕底部距离*/
-(Toast*(^)(CGFloat fontSize))setDistanceButtom;

/**OC链式语法调用 设置提醒消息出现动画时间*/
-(Toast*(^)(NSTimeInterval atime))setAnimationDuration;

/**OC链式语法调用 设置提醒消息隐藏完成回调*/
-(Toast*(^)(void(^)()))setHiddenComplete;
/**
 *  设置消息显示的动画
 *  请在最后调用本方法显示消息
 *  @return Toast *(^)(AnimationType)
 */
-(Toast *(^)(AnimationType aType))show;
@end
