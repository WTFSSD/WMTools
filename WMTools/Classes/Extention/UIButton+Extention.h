//
//  UIButton+Extention.h
//
//  Created by seed on 2016/11/26.
//  Copyright © 2016年 seed. All rights reserved.
//



#import <UIKit/UIKit.h>
typedef void(^ActionBlock)(UIButton * button);
@interface UIButton (Extention)


+(instancetype)makeButton:(void(^)(UIButton * button))block;


-(UIButton*(^)(CGRect frame))setFrame;

-(UIButton*(^)(id target,SEL action,UIControlEvents events))addTarget;

-(UIButton*(^)(NSString*title,UIControlState state))setTitle;

-(UIButton*(^)(UIColor*color,UIControlState state))setTitleColor;

-(UIButton*(^)(UIFont * font))setTitleFont;

-(UIButton*(^)(UIEdgeInsets edgs))setTitleEdgs;

-(UIButton*(^)(UIEdgeInsets edgs))setImageEdgs;

-(UIButton*(^)(UIImage * image,UIControlState state))setBackgroundImage;

-(UIButton*(^)(UIImage * image,UIControlState state))setImage;


-(UIButton*(^)(ActionBlock block,UIControlEvents events))setActionBlock;

@end
