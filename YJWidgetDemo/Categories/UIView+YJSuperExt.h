//
//  UIView+YJSuperExt.h
//  YJWidgetDemo
//
//  Created by YJHou on 2017/3/28.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJSuperExt)

/** 设置圆角和边框 */
- (void)yj_cornerRadius:(CGFloat)radius
                  color:(UIColor *)color
            borderWidth:(CGFloat)borderWidth;

@end
