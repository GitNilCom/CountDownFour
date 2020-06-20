//
//  CETimeCountDownLabelTextStlyeTool.m
//  CountDownFour
//
//  Created by CE on 2017/7/15.
//  Copyright © 2017年 CE. All rights reserved.
//

#import "CETimeCountDownLabelTextStlyeTool.h"

@implementation CETimeCountDownLabelTextStlyeTool

+ (NSArray *)getTextArrayWithLabel:(CETimeCountDownLabel *)label{

    NSArray *texts = nil;
    switch (label.textStyle) {
        case CETextStlyeDDHHMMSSBox:{
        
            texts =[self setupLabelTextDDHHMMSSWithLabel:label];
        }
            
            break;
        case CETextStlyeDDHHMMSSChineseBox:{
            
            texts =[self setupLabelTextDDHHMMSSWithLabel:label];
        }
            
            break;
        case CETextStlyeHHMMSSBox:{
            
            texts = [self setupLabelTextHHMMSSWithLabel:label];
        }
            
            break;
        case CETextStlyeHHMMSSChineseBox:{
            texts = [self setupLabelTextHHMMSSWithLabel:label];
        }
            
            break;
        case CETextStlyeMMSSBox:{
            
            texts = [self setupLabelTextMMSSWithLabel:label];
        }
            
            break;
        case CETextStlyeMMSSChineseBox:{
             texts = [self setupLabelTextMMSSWithLabel:label];
        }
            
            break;
        case CETextStlyeSSBox:{
            
             texts = [self setupLabelTextSSWithLabel:label];
        }
            
            break;
        case CETextStlyeSSChineseBox:{
            
             texts = [self setupLabelTextSSWithLabel:label];
        }
            
            break;

        default:
            break;
    }
    
    
    return texts;
}



+ (NSArray *)setupLabelTextDDHHMMSSWithLabel:(CETimeCountDownLabel *)label{
    
    NSMutableArray *textArray = [NSMutableArray array];
    NSString *dayStr;NSString *hourStr;NSString *minuteStr;NSString *secondStr;
    dayStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.days,label.dayAddString];
    hourStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.hours,label.hourAddString];
    minuteStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.minutes,label.minuteAddString];
    secondStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.seconds,label.secondAddString];
    
    if (label.textIntervalSymbol) {
        
        [textArray addObject:dayStr];
        [textArray addObject:label.textIntervalSymbol];
        [textArray addObject:hourStr];
        [textArray addObject:label.textIntervalSymbol];
        [textArray addObject:minuteStr];
        [textArray addObject:label.textIntervalSymbol];
        [textArray addObject:secondStr];
        
    }else{
        
        [textArray addObject:dayStr];
        [textArray addObject:hourStr];
        [textArray addObject:minuteStr];
        [textArray addObject:secondStr];
    }
    
    return textArray;
    
}

+ (NSArray *)setupLabelTextHHMMSSWithLabel:(CETimeCountDownLabel *)label{
    
    NSInteger hours = label.days*24+label.hours;
    NSMutableArray *textArray = [NSMutableArray array];
    NSString *hourStr;NSString *minuteStr;NSString *secondStr;
    
    hourStr = [NSString stringWithFormat:@"%.2ld%@",(long)hours,label.hourAddString];
    minuteStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.minutes,label.minuteAddString];
    secondStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.seconds,label.secondAddString];
    
    if (label.textIntervalSymbol) {
        [textArray addObject:hourStr];
        [textArray addObject:label.textIntervalSymbol];
        [textArray addObject:minuteStr];
        [textArray addObject:label.textIntervalSymbol];
        [textArray addObject:secondStr];
        
    }else{
        [textArray addObject:hourStr];
        [textArray addObject:minuteStr];
        [textArray addObject:secondStr];
    }
    
    return textArray;
    
}

+ (NSArray *)setupLabelTextMMSSWithLabel:(CETimeCountDownLabel *)label{
    
    NSInteger minutes = (label.days*24+label.hours)*60+label.minutes;
    NSMutableArray *textArray = [NSMutableArray array];
    NSString *minuteStr;NSString *secondStr;
    
    minuteStr = [NSString stringWithFormat:@"%.2ld%@",(long)minutes,label.minuteAddString];
    secondStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.seconds,label.secondAddString];
    
    if (label.textIntervalSymbol) {
        [textArray addObject:minuteStr];
        [textArray addObject:label.textIntervalSymbol];
        [textArray addObject:secondStr];
        
    }else{
        [textArray addObject:minuteStr];
        [textArray addObject:secondStr];
    }
    
    return textArray;
}

+ (NSArray *)setupLabelTextSSWithLabel:(CETimeCountDownLabel *)label{

    NSMutableArray *textArray = [NSMutableArray array];
    NSString *secondStr;
     secondStr = [NSString stringWithFormat:@"%.2ld%@",(long)label.totalSeconds,label.secondAddString];
    
    if (label.textIntervalSymbol) {

        [textArray addObject:secondStr];
        
    }else{
        [textArray addObject:secondStr];
    }
    
    return textArray;
    
}

+ (BOOL)isBoxStyleWithLabel:(CETimeCountDownLabel *)label{

    if (label.textStyle == CETextStlyeDDHHMMSSBox ||
          label.textStyle == CETextStlyeDDHHMMSSChineseBox||
          label.textStyle == CETextStlyeHHMMSSBox ||
          label.textStyle == CETextStlyeHHMMSSChineseBox||
          label.textStyle == CETextStlyeMMSSBox ||
          label.textStyle == CETextStlyeMMSSChineseBox||
          label.textStyle == CETextStlyeSSBox ||
          label.textStyle == CETextStlyeSSChineseBox) {
       
        return YES;
    }
    return NO;
}

+ (CGRect)textBoxAlignmentRectWithLabel:(CETimeCountDownLabel *)label boxWidth:(CGFloat)boxWidth rect:(CGRect)rect{
    
    CGRect newRext = CGRectMake(0, 0, rect.size.width, rect.size.height);
    switch (label.jj_textAlignment) {
      
        case CETextAlignmentStlyeLeftCenter:
        {
            newRext.origin.x = -label.textBackgroundBorderWidth/2.0;
            newRext.origin.y = [self levelOriginYWithLabel:label];
        }
            break;
        case CETextAlignmentStlyeCenter:
        {
            CGFloat width = CGRectGetWidth(rect);
            if (boxWidth < width) {
                newRext.origin.x = (width-boxWidth)/2.0;
            }
            newRext.origin.y = [self levelOriginYWithLabel:label];
            
        }
            break;
        case CETextAlignmentStlyeLeftTop:
        {
            newRext.origin.x =-label.textBackgroundBorderWidth/2.0;
            newRext.origin.y = -label.textBackgroundBorderWidth/2.0;
        }
            break;
        case CETextAlignmentStlyeCustom:
        {
            newRext.origin.x = label.textLeftDeviation-label.textBackgroundBorderWidth/2.0;
            newRext.origin.y = label.textTopDeviation-label.textBackgroundBorderWidth/2.0;
        }
            break;


        case CETextAlignmentStlyeCenterTop:
        {
            CGFloat width = CGRectGetWidth(rect);
            if (boxWidth < width) {
                newRext.origin.x = (width-boxWidth)/2.0;
            }
            newRext.origin.y = -label.textBackgroundBorderWidth/2.0;
        }
            break;
        case CETextAlignmentStlyeLeftBottom:
        {
            newRext.origin.x = -label.textBackgroundBorderWidth/2.0;
            newRext.origin.y = [self bottomOriginYWithLabel:label];
        }
            break;
        case CETextAlignmentStlyeCenterBottom:
        {
            CGFloat width = CGRectGetWidth(rect);
            if (boxWidth < width) {
                newRext.origin.x = (width-boxWidth+label.textBackgroundBorderWidth)/2.0;
            }
            newRext.origin.y = [self bottomOriginYWithLabel:label];
        }
            break;
        case CETextAlignmentStlyeRightBottom:
        {
           newRext.origin.x = [self rightOriginXWithLabel:label boxWidth:boxWidth];
            newRext.origin.y = [self bottomOriginYWithLabel:label];
        }
            break;
        case CETextAlignmentStlyeRightTop:
        {
           newRext.origin.x = [self rightOriginXWithLabel:label boxWidth:boxWidth];
            newRext.origin.y = -label.textBackgroundBorderWidth/2.0;
        }
            break;
        case CETextAlignmentStlyeCenterRight:
        {
            newRext.origin.x = [self rightOriginXWithLabel:label boxWidth:boxWidth];
           newRext.origin.y = [self levelOriginYWithLabel:label];
        }
            break;
            
        case CETextAlignmentStlyeHorizontalCenter:
        {
           newRext.origin.y = [self levelOriginYWithLabel:label];
            newRext.origin.x = label.textLeftDeviation - label.textBackgroundBorderWidth/2.0;
        }
            break;
            
        case CETextAlignmentStlyeVerticalCenter:
        {
            CGFloat width = CGRectGetWidth(rect);
            if (boxWidth < width) {
                newRext.origin.x = (width-boxWidth)/2.0;
            }
            newRext.origin.y = label.textTopDeviation - label.textBackgroundBorderWidth/2.0;
        }
            break;
            
        default:
            break;
    }
    
    
    return newRext;
}

/**
 获取水平居中，偏离顶部多少

 */
+ (CGFloat)levelOriginYWithLabel:(CETimeCountDownLabel *)label{

    CGFloat originY = 0;
    CGFloat h = label.frame.size.height;
    if (label.textHeight < h) {
        originY = (h - label.textHeight+2)/2.0;
    }
    return originY;
}

+ (CGFloat)bottomOriginYWithLabel:(CETimeCountDownLabel *)label{

    CGFloat originY = 0;
    CGFloat h = label.frame.size.height;
    if (label.textHeight < h) {
        originY = h - label.textHeight+label.textBackgroundBorderWidth/2.0;;
    }
    return originY;
}

+ (CGFloat)rightOriginXWithLabel:(CETimeCountDownLabel *)label boxWidth:(CGFloat)boxWidth{

    CGFloat originX = 0;
    CGFloat width = CGRectGetWidth(label.frame);
    if (boxWidth < width) {
        originX = width-boxWidth+label.textBackgroundBorderWidth/2.0;
    }
    return originX;
}

@end
