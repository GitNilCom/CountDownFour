//
//  CETableViewCell.h
//  CountDownFour
//
//  Created by CE on 2017/7/12.
//  Copyright © 2017年 CE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CEOneTimeCountDownLabel.h"

@interface CETableViewCell : UITableViewCell

@property (nonatomic ,strong) CEOneTimeCountDownLabel *timeLabel;

@end
