//
//  CETableViewCell.m
//  CountDownFour
//
//  Created by CE on 2017/7/12.
//  Copyright © 2017年 CE. All rights reserved.
//

#import "CETableViewCell.h"

@implementation CETableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.timeLabel = [[CEOneTimeCountDownLabel alloc] init];
    self.timeLabel.frame = CGRectMake(20, 0, CGRectGetWidth(self.frame)-40, 20);
    [self.contentView addSubview:self.timeLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.timeLabel.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
