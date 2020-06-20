//
//  CETimeCountDownLabelTextStlyeTool.h
//  CountDownFour
//
//  Created by CE on 2017/7/15.
//  Copyright © 2017年 CE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CETimeCountDownLabel.h"

@interface CETimeCountDownLabelTextStlyeTool : NSObject

+ (NSArray *)getTextArrayWithLabel:(CETimeCountDownLabel *)label;

+ (BOOL)isBoxStyleWithLabel:(CETimeCountDownLabel *)label;
+ (CGRect)textBoxAlignmentRectWithLabel:(CETimeCountDownLabel *)label boxWidth:(CGFloat)boxWidth rect:(CGRect)rect;

@end
