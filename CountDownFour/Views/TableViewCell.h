//
//  TableViewCell.h
//  CountDownFour
//
//  Created by CE on 2017/7/10.
//  Copyright © 2017年 CE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CETimeCountDownLabel.h"
#import "TimeModel.h"
@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CETimeCountDownLabel *timeLabel;
@property (weak, nonatomic) IBOutlet CETimeCountDownLabel *twoTimeLabel;
@property (weak, nonatomic) IBOutlet CETimeCountDownLabel *threeTImeLabel;

@end
