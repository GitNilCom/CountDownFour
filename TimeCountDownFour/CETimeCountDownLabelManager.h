//
//  CETimeCountDownLabelManager.h
//  CountDownFour
//
//  Created by CE on 2017/7/14.
//  Copyright © 2017年 CE. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CETimeCountDownLabel;

@protocol CETimeCountDownLabelManagerDelegate <NSObject>

- (NSAttributedString *)labelTimeStringWithModel:(id)model timeLabel:(CETimeCountDownLabel *)timeLabel;

- (void)labelOutDateWithTimeLabel:(CETimeCountDownLabel *)timeLabel;

@end

@interface CETimeCountDownLabelManager : NSObject

@property (nonatomic ,weak) id <CETimeCountDownLabelManagerDelegate> delegate;

/**
 添加倒计时，添加后自动启动定时器 ，一般用于页面上可见少量的定时器
 
 @param timeLabel 时间视图
 @param time 时间
 */
- (void)addTimeLabel:(CETimeCountDownLabel *)timeLabel time:(NSString *)time;

/**
 销毁定时器
 */
- (void)destoryLabelTimer;

@end
