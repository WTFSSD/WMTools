//
//  NSString+Extention.m
//  ToastDemo
//
//  Created by seed on 2016/11/25.
//  Copyright © 2016年 WTFSSD. All rights reserved.
//

#import "NSString+Extention.h"

@implementation NSString (Extention)
-(NSString*(^)(id))add{
    return ^(id s){
        return  [NSString stringWithFormat:@"%@%@",self,s];
    };
}


-(NSString *(^)(NSString *))rm_s{
    return ^(NSString * s){
        return [self stringByReplacingOccurrencesOfString:s withString:@""];
    };
}


-(NSString *(^)(NSString *))rm_c{
    return ^(NSString * c){
        NSString * mstr = [[NSString alloc] initWithString:self];
       const char *  ss = [c cStringUsingEncoding:NSUTF8StringEncoding];
        for (int i  = 0 ; i<c.length; i++) {
            char cc = ss[i];
            mstr =  [mstr stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%c",cc] withString:@""];
        }
        return mstr;
    };
}


-(NSString *(^)(NSString *, NSString *))rp_s{
    return ^(NSString * s,NSString * rps){
        return [self stringByReplacingOccurrencesOfString:s withString:rps];
    };
}


@end
