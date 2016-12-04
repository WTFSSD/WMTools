//
//  UIAlertController+Extention.m
//
//  Created by seed on 2016/11/29.
//  Copyright © 2016年 seed. All rights reserved.
//

#import "UIAlertController+Extention.h"

#import <objc/runtime.h>

@implementation UIAlertController (Extention)
const char cancelButtonKey = '\0';
const char destructiveButtonKey = '\0';
const char defaultButtonsKey = '\0';
const char handleBlockKey = '\0';
+(UIAlertController *)makeAlertWithStyle:(UIAlertControllerStyle)style makeBlock:(void (^)(UIAlertController *))block{
    if(block){
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:style];
        block(alert);
        return alert;
    };
    return nil;
}

-(UIAlertController *(^)(NSString *))setTitle{
    return ^(NSString * title){
        self.title = title;
        return self;
    };
}

-(UIAlertController *(^)(NSString *))setMsg{
    return ^(NSString * title){
        self.message = title;
        return self;
    };
}

-(UIAlertController *(^)(NSString *))addCancelButton{
    return ^(NSString * title){
        UIAlertAction * act = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            for (UITextField * ttt in self.textFields) {
                [ttt resignFirstResponder];
            }
            void (^block)(NSString * title) = objc_getAssociatedObject(self, &handleBlockKey);
            if(block){
                block(action.title);
            }
            
        }];
        [self addAction:act];
        return self;
    };
}

-(UIAlertController *(^)(NSString *))addDefaultButton{
    return ^(NSString * title){
       
        UIAlertAction * act = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            for (UITextField * ttt in self.textFields) {
                [ttt resignFirstResponder];
            }
            void (^block)(NSString * title) = objc_getAssociatedObject(self, &handleBlockKey);
            if(block){
                block(action.title);
            }
    
        }];
        [self addAction:act];
        return self;
    };
}


-(UIAlertController *(^)(NSString *))addDestructiveButton{
    return ^(NSString * title){
        UIAlertAction * act = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            for (UITextField * ttt in self.textFields) {
                [ttt resignFirstResponder];
            }
            void (^block)(NSString * title) = objc_getAssociatedObject(self, &handleBlockKey);
            if(block){
                block(action.title);
            }
            
        }];
        [self addAction:act];
        return self;
    };
}

-(UIAlertController *(^)(void (^)(NSString *)))addHandleBlock{
    return ^(void (^block)(NSString *)){
        objc_setAssociatedObject(self, &handleBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
}





@end
