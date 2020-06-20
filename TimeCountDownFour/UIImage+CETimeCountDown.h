//
//  UIImage+CETimeCountDown.h
//  CountDownFour
//
//  Created by CE on 2017/7/14.
//  Copyright © 2017年 CE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CETimeCountDown)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 将图片裁剪成带边框圆
 @param image 图片
 @param borderWidth 图片边框宽度
 @param borderColor 边框颜色
 @return 返回裁剪图片
 */
+ (UIImage *)circleImage:(UIImage *)image radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
