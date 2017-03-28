//
//  UIView+YJSuperExt.m
//  YJWidgetDemo
//
//  Created by YJHou on 2017/3/28.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import "UIView+YJSuperExt.h"

@implementation UIView (YJSuperExt)

/** 设置圆角和边框 */
- (void)yj_cornerRadius:(CGFloat)radius
                  color:(UIColor *)color
            borderWidth:(CGFloat)borderWidth{
    
    if (radius > 0) {
        self.layer.cornerRadius = radius;
    }
    if (color && borderWidth > 0) {
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = borderWidth;
    }
}

@end
