//
//  UIButton+Extention.m
//
//  Created by seed on 2016/11/26.
//  Copyright © 2016年 seed. All rights reserved.
//

#import "UIButton+Extention.h"

#import <objc/runtime.h>

static const char actionBloclKey = '\0';
@implementation UIButton (Extention)


+(instancetype)makeButton:(void(^)(UIButton * button))block{
    if(block){
         UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        block(button);
        return button;
    }
    return nil;
}

-(UIButton*(^)(NSString*title,UIControlState state))setTitle{
    return ^(NSString*title,UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}

-(UIButton *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}


-(UIButton*(^)(id target,SEL action,UIControlEvents events))addTarget{
    return ^(id target,SEL action,UIControlEvents events){
        [self addTarget:target action:action forControlEvents:events];
        return self;
    };
}

-(UIButton*(^)(UIColor*color,UIControlState state))setTitleColor{
    return ^(UIColor*color,UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}

-(UIButton*(^)(UIFont * font))setTitleFont{
    return ^(UIFont * font){
        self.titleLabel.font = font;
        return self;
    };
}

-(UIButton*(^)(UIEdgeInsets edgs))setTitleEdgs{
    return ^(UIEdgeInsets edgs){
        [self setTitleEdgeInsets:edgs];
        return self;
    };
    
}

-(UIButton*(^)(UIEdgeInsets edgs))setImageEdgs{
    return ^(UIEdgeInsets edgs){
        [self setImageEdgeInsets:edgs];
        return self;
    };
}


-(UIButton*(^)(UIImage * image,UIControlState state))setBackgroundImage{
    return ^(UIImage * image,UIControlState state){
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

-(UIButton*(^)(UIImage * image,UIControlState state))setImage{
    return ^(UIImage * image,UIControlState state){
        [self setImage:image forState:state];
        return self;
    };
}

-(UIButton*(^)(ActionBlock block,UIControlEvents events))setActionBlock{
    return ^(ActionBlock block,UIControlEvents events){
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:events];
        if(block)
        objc_setAssociatedObject(self, &actionBloclKey, block, OBJC_ASSOCIATION_COPY);
        return self;
    };
}


-(void)buttonClick:(UIButton*)button{
    ActionBlock block = objc_getAssociatedObject(self, &actionBloclKey);
    if(block){
        block(button);
    }
}
@end
