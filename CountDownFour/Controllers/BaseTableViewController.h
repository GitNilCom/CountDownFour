//
//  BaseTableViewController.h
//  CountDownFour
//
//  Created by CE on 2017/7/11.
//  Copyright © 2017年 CE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CETimeCountDown.h"
#import "TableViewCell.h"
#import "TimeModel.h"

@interface BaseTableViewController : UITableViewController<CETimeCountDownDelegate>

@property(nonatomic,strong) NSMutableArray *dataList;

@property(nonatomic,strong) CETimeCountDown * countDown;

- (void)addData;

@end
