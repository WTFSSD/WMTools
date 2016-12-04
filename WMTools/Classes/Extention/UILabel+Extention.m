//
//  UILabel+Extention.m
//
//  Created by seed on 2016/11/28.
//  Copyright © 2016年 seed. All rights reserved.
//

#import "UILabel+Extention.h"

@implementation UILabel (Extention)

+(instancetype)makeLabel:(void (^)(UILabel *))block{
    if(block){
        UILabel * label = [[UILabel alloc] init];
        block(label);
        return label;
    }
    return nil;
}
@end
