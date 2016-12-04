//
//  UILabel+Extention.h
//
//  Created by seed on 2016/11/28.
//  Copyright © 2016年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extention)

+(instancetype)makeLabel:(void(^)(UILabel*label))block;


@end
