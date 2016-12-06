//
//  Toast.m
//  ToastDemo
//
//  Created by WTFSSD on 2016/11/23.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//




#import "Toast.h"

@interface Toast()

@property(nonatomic,assign,readwrite)NSTimeInterval duration;

@property(nonatomic,strong,readwrite)UIColor * textColor;

@property(nonatomic,strong,readwrite)UIColor * backgroundColor;

@property(nonatomic,assign,readwrite)CGFloat  textFontSize;

@property(nonatomic,assign,readwrite)AnimationType aType;

@property(nonatomic,strong)UILabel * msgLabel;

@property(nonatomic,strong,readwrite)UIWindow * tWindow;

@property(nonatomic,assign)CGFloat distanceBottom;

@property(nonatomic,assign)NSTimeInterval animationDuration;

@property(nonatomic,copy)void(^complete)();

//MARK:是否启用单例
//#define havesingle

@end
@implementation Toast


-(instancetype)init{
    if(self = [super init]){
        self.aType = AnimationTypeDefault;
        self.distanceBottom = 50;
        self.animationDuration = 0.3f;
        self.duration = 1.f;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeScreen:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    }
    return self;
}


-(void)didChangeScreen:(NSNotification*)noti{
    
//    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait
//        || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown) {
//        //竖屏
//        NSLog(@"竖屏");
//    } else {
//        //横屏
//        NSLog(@"横屏");
//    }
    
    CGSize size = [self sizeWithString:self.msgLabel.text InAre:(CGSize){ScreenWidth*0.8,MAXFLOAT} fontSize:self.textFontSize];
    self.msgLabel.frame = (CGRect){(ScreenWidth - size.width - 40)*0.5,ScreenHeight - size.height - self.distanceBottom,size.width + 20,size.height + 20};
}

#ifdef havesingle
+(instancetype)toast{
    static dispatch_once_t onceToken;
    static Toast * t = nil;
    dispatch_once(&onceToken, ^{
        t = [[self alloc] init];
    });
    return t;
}
#else

+(instancetype)toast{
    return [[self alloc] init];
}
#endif

+(void)makeToast:(void (^)(Toast *))block{
    if(block){
        Toast * t = [Toast toast];
        block(t);
    }
    return;
}

#pragma mark - 文字字体大小
-(CGFloat)textFontSize{
    if(_textFontSize == 0){
        _textFontSize = 14;
    }
    return _textFontSize;
}

#pragma mark - 文字颜色
-(UIColor *)textColor{
    if(_textColor == nil){
        _textColor = [UIColor whiteColor];
    }
    return _textColor;
}

#pragma mark - 背景颜色
-(UIColor *)backgroundColor{
    if(_backgroundColor == nil){
        _backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    }
    return _backgroundColor;
}

-(UIWindow *)tWindow{
    if(_tWindow == nil){
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        if (window.windowLevel != UIWindowLevelNormal)
        {
            NSArray *windows = [[UIApplication sharedApplication] windows];
            for(UIWindow * tmpWin in windows)
            {
                if (tmpWin.windowLevel == UIWindowLevelNormal)
                {
                    window = tmpWin;
                    break;
                }
            }
        }
        
        _tWindow = window;
    }
    return _tWindow;
}

-(UILabel *)msgLabel{
    if(_msgLabel == nil){
        _msgLabel = [[UILabel alloc] initWithFrame:(CGRect){0,0,0,0}];
        _msgLabel.font = [UIFont systemFontOfSize:self.textFontSize];
        _msgLabel.textColor = self.textColor;
        _msgLabel.backgroundColor = self.backgroundColor;
        _msgLabel.textAlignment = NSTextAlignmentCenter;
        _msgLabel.numberOfLines = 0;
    }
    return _msgLabel;
}
-(Toast *(^)(NSString *))setMsg{
    Toast*(^block)() = ^(NSString * msg){
        CGSize size = [self sizeWithString:msg InAre:(CGSize){ScreenWidth*0.8,MAXFLOAT} fontSize:self.textFontSize];
        self.msgLabel.frame = (CGRect){(ScreenWidth - size.width - 40)*0.5,ScreenHeight - size.height - self.distanceBottom,size.width + 20,size.height + 20};
        self.msgLabel.text = msg;
        self.msgLabel.layer.cornerRadius = 10;
        self.msgLabel.layer.masksToBounds = YES;
        [self.tWindow addSubview:self.msgLabel];
        [self.tWindow bringSubviewToFront:self.msgLabel];
        self.msgLabel.alpha = 0;
        return self;
    };
    return block;
}

-(Toast *(^)(NSTimeInterval))hiddenAfter{
    Toast*(^block)() = ^(NSTimeInterval duration){
        self.duration = duration;
        return self;
    };
    return block;
    
}

-(Toast *(^)(UIColor *))setTextColor{
    Toast*(^block)() = ^(UIColor * textColor){
        self.msgLabel.textColor = textColor;
        return self;
    };
    return block;
    
}

-(Toast *(^)(CGFloat))setFontSize{
    Toast*(^block)() = ^(CGFloat fontSize){
        return self;
    };
    return block;
}

-(Toast *(^)(UIColor *))setBackgroundColor{
    Toast *(^block)() = ^(UIColor * aColor){
        self.msgLabel.backgroundColor = aColor;
        return self;
    };
    return block;
}

-(Toast *(^)(NSTimeInterval))setAnimationDuration{
    Toast*(^block)() = ^(NSTimeInterval atime){
        self.animationDuration = atime;
        return self;
    };
    return block;
}

-(Toast *(^)(AnimationType))show{
    Toast*(^block)() = ^(AnimationType atype){
        __block CGRect frame = self.msgLabel.frame;
        self.aType = atype;
        switch (self.aType) {
            case AnimationTypeFade:{
                self.msgLabel.alpha = 0;
                [UIView animateWithDuration:self.animationDuration animations:^{
                    self.msgLabel.alpha = 1;
                }];
            }break;
            case AnimationTypeMoveDTU:{
                frame.origin.y = ScreenHeight;
                self.msgLabel.frame = frame;
                self.msgLabel.alpha = 1;
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.y = ScreenHeight - self.msgLabel.frame.size.height - self.distanceBottom;
                    self.msgLabel.frame = frame;
                    
                }];
            }break;
            case AnimationTypeMoveUTD:{
                frame.origin.y = -frame.size.height;
                self.msgLabel.frame = frame;
                self.msgLabel.alpha = 1;
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.y = ScreenHeight - self.msgLabel.frame.size.height - self.distanceBottom;
                    self.msgLabel.frame = frame;
                    
                }];
            }break;
            case AnimationTypeMoveLTR:{
                frame.origin.y = ScreenHeight - self.msgLabel.frame.size.height - self.distanceBottom;
                frame.origin.x = -frame.size.width;
                self.msgLabel.frame = frame;
                self.msgLabel.alpha = 1;
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.x = (ScreenWidth - frame.size.width)*0.5;
                    self.msgLabel.frame = frame;
                }];
                
            }break;
            case AnimationTypeMoveRTL:{
                frame.origin.y = ScreenHeight - self.msgLabel.frame.size.height - self.distanceBottom;
                frame.origin.x = ScreenWidth;
                self.msgLabel.frame = frame;
                self.msgLabel.alpha = 1;
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.x = (ScreenWidth - frame.size.width)*0.5;
                    self.msgLabel.frame = frame;
                }];
            }break;
            default:
                break;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.hidden();
        });
        return self;
    };
    return block;

}


-(Toast *(^)(CGFloat))setDistanceButtom{
    Toast*(^block)() = ^(CGFloat distance){
        self.distanceBottom = distance;
        CGRect frame = self.msgLabel.frame;
        frame.origin.y = ScreenHeight - frame.size.height - distance;
        self.msgLabel.frame = frame;
        return self;
    };
    return block;
}

-(Toast *(^)())hidden{
    Toast*(^block)() = ^(){
        __block CGRect frame = self.msgLabel.frame;

        switch (self.aType) {
            case AnimationTypeFade:{
                [UIView animateWithDuration:self.animationDuration animations:^{
                    self.msgLabel.alpha = 0;
                }completion:^(BOOL finished) {
                    [self.msgLabel removeFromSuperview];
                    if(self.complete)self.complete();
                }];
            }break;
            case AnimationTypeMoveDTU:{
                
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.y = ScreenHeight;
                    self.msgLabel.frame = frame;
                    
                }completion:^(BOOL finished) {
                    [self.msgLabel removeFromSuperview];
                    if(self.complete)self.complete();
                }];
            }break;
            case AnimationTypeMoveUTD:{
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.y = -frame.size.height;
                    self.msgLabel.frame = frame;
                    
                }completion:^(BOOL finished) {
                    [self.msgLabel removeFromSuperview];
                    if(self.complete)self.complete();
                }];
            }break;
            case AnimationTypeMoveLTR:{
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.x = -frame.size.width;
                    self.msgLabel.frame = frame;
                    
                }completion:^(BOOL finished) {
                    [self.msgLabel removeFromSuperview];
                    if(self.complete)self.complete();
                }];
            }break;
            case AnimationTypeMoveRTL:{
                [UIView animateWithDuration:self.animationDuration animations:^{
                    frame.origin.x = ScreenWidth;
                    self.msgLabel.frame = frame;
                    
                }completion:^(BOOL finished) {
                    [self.msgLabel removeFromSuperview];
                    if(self.complete)self.complete();
                }];
            }break;
            default:
                break;
        }
        return self;
    };
    return block;
}

-(Toast *(^)(void (^)()))setHiddenComplete{
    return ^(void (^block)()){
        self.complete = block;
        return self;
    };
}

-(CGSize)sizeWithString:(NSString*)msg InAre:(CGSize)are fontSize:(CGFloat)fontSize{
    NSDictionary * attribuite = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGSize textSize;
    textSize = [msg boundingRectWithSize:are options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribuite context:nil].size;
    return textSize;
    
}

-(void)dealloc{
    NSLog(@"%@",@"toast销毁了");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
