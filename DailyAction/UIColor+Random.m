//
//  UIColor+Random.m
//  DailyAction
//
//  Created by 蔺雪菲尘 on 14-6-17.
//  Copyright (c) 2014年 Bonnie. All rights reserved.
//

#import "UIColor+Random.h"
@implementation UIColor (Random)
+(UIColor *)randomColor{
    static BOOL seed = NO;
    if (!seed) {
        seed = YES;
        srandom(time(NULL));
    }
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];//alpha为1.0,颜色完全不透明
}
@end