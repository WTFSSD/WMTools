//
//  Toast.h
//  ToastDemo
//
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

+(void)makeToast:(void(^)(Toast* toast))block;

-(Toast*(^)(NSString * msg))setMsg;
-(Toast*(^)(NSTimeInterval duration))hiddenAfter;
-(Toast*(^)(CGFloat fontSize))setFontSize;
-(Toast*(^)(UIColor * textColor))setTextColor;
-(Toast*(^)(UIColor * textColor))setBackgroundColor;
-(Toast*(^)(CGFloat fontSize))setDistanceButtom;
-(Toast*(^)(NSTimeInterval atime))setAnimationDuration;

-(Toast*(^)(void(^)()))setHiddenComplete;

/**
 *  设置消息显示的动画
 *  请在最后调用本方法显示消息
 *  @return Toast *(^)(AnimationType)
 */

-(Toast *(^)(AnimationType aType))show;
@end
