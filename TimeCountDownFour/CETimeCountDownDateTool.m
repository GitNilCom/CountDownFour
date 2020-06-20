//
//  CETimeCountDownDateTool.m
//  CountDownFour
//
//  Created by CE on 2017/7/11.
//  Copyright © 2017年 CE. All rights reserved.
//

#import "CETimeCountDownDateTool.h"

@implementation CETimeCountDownDateTool

/**
 转成时间戳
 
 @param str 时间字符串
 @param timeStyle 时间格式
 @return 时间戳
 */
+ (long long)getTimeTampWithStr:(NSString *)str timeStyle:(CECountDownTimeStyle)timeStyle{

    if (timeStyle == CECountDownTimeStyleTamp) {
        return str.longLongValue;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (timeStyle == CECountDownTimeStyleNormal) {
      [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    }else if (timeStyle == CECountDownTimeStylePureNumber){
      [formatter setDateFormat:@"YYYYMMddHHmmss"];
    }
    NSDate* date = [formatter dateFromString:str];
    long long timeTamp = [date timeIntervalSince1970];
    return timeTamp;
}


/**
 在当前的时间上追加秒数
 
 @param seconds 追加秒数
 @param timeStyle 时间格式
 @return 时间字符串
 */
+ (NSString *)dateByAddingSeconds:(NSInteger)seconds timeStyle:(CECountDownTimeStyle)timeStyle{

    NSTimeInterval aTimeInterval = [NSDate timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *timeStr = nil;
    if (timeStyle == CECountDownTimeStyleNormal) {
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        timeStr = [formatter stringFromDate:newDate];
    }else if (timeStyle == CECountDownTimeStylePureNumber){
        [formatter setDateFormat:@"YYYYMMddHHmmss"];
        timeStr = [formatter stringFromDate:newDate];
    }else if (timeStyle == CECountDownTimeStyleTamp){
       
        timeStr = [NSString stringWithFormat:@"%ld",(long)[newDate timeIntervalSince1970]];
    }
    return timeStr;
}

@end
