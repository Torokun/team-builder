//
//  UIIntColor.m
//  team-builder
//
//  Created by Toro on 2014/03/29.
//  Copyright (c) 2014年 Toro. All rights reserved.
//

#import "UIIntColor.h"

@implementation UIIntColor

+ (UIColor *) colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha
{
    UIColor *uiColor = NULL;
    if(red < 0 || red > 255) {
        return uiColor;
    }
    if(green < 0 || green > 255) {
        return uiColor;
    }
    if(blue < 0 || blue > 255) {
        return uiColor;
    }
    if(alpha < 0 || alpha > 255) {
        return uiColor;
    }
    double dRed = (double)red / 255;
    double dGreen = (double)green / 255;
    double dBlue = (double)blue / 255;
    double dAlpha = (double)alpha / 255;
    uiColor = [UIColor colorWithRed:dRed green:dGreen blue:dBlue alpha:dAlpha];
    return uiColor;
}

@end
