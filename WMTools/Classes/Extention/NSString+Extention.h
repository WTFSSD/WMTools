//
//  NSString+Extention.h
//  Created by seed on 2016/11/25.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extention)

/**拼接内容*/
-(NSString*(^)(id))  add;

/**移除指定字符串*/
-(NSString*(^)(NSString * s))rm_s;

/**移除指定集合*/
-(NSString*(^)(NSString * s))rm_c;

/**替换指定的字符串*/
-(NSString*(^)(NSString * s,NSString * rps))rp_s;

@end
