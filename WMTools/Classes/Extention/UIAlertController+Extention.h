//
//  UIAlertController+Extention.h
//
//  Created by seed on 2016/11/29.
//  Copyright © 2016年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extention)
+(UIAlertController*)makeAlertWithStyle:(UIAlertControllerStyle)style makeBlock:(void(^)(UIAlertController* alert))block;


-(UIAlertController*(^)(NSString * title))setTitle;
-(UIAlertController*(^)(NSString * title))setMsg;
-(UIAlertController*(^)(NSString * title))addDestructiveButton;
-(UIAlertController*(^)(NSString * title))addDefaultButton;
-(UIAlertController*(^)(NSString * title))addCancelButton;
-(UIAlertController*(^)(void(^)(NSString * title)))addHandleBlock;
@end
