//
//  CECollectionViewCell.h
//  CountDownFour
//
//  Created by CE on 2017/7/11.
//  Copyright © 2017年 CE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CETimeCountDownLabel.h"
@interface CECollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet CETimeCountDownLabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *watchImageView;

@end
