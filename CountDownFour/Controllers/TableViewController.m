//
//  TableViewController.m
//  CountDownFour
//
//  Created by CE on 2017/7/10.
//  Copyright © 2017年 CE. All rights reserved.
//

#import "TableViewController.h"
#import "CETableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    CETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[CETableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    TimeModel *model = self.dataList[indexPath.row];
    //一定要设置，设置时间数据
    [cell.timeLabel setupCellWithModel:model indexPath:indexPath];
    //在不设置为过时自动删除情况下 设置该方法后，滑动过快的时候时间不会闪情况
    cell.timeLabel.attributedText = [self.countDown countDownWithTimeLabel:cell.timeLabel];
    
    return cell;
}


- (CETimeCountDown *)countDown{

    CETimeCountDown *countDown = [super countDown];
    return countDown;
}

- (void)scrollViewWithAutomaticallyDeleteModel:(id)model{
    
    NSLog(@"==model:%@===endTime=%@===",model,[model valueForKey:@"endTime"]);
}


- (NSAttributedString *)customTextWithTimeLabel:(CETimeCountDownLabel *)timeLabel timeCountDown:(CETimeCountDown *)timeCountDown{

    NSArray *textArray = @[[NSString stringWithFormat:@"%.2ld",(long)timeLabel.days],
                           @" 天",
                           [NSString stringWithFormat:@"  %.2ld",(long)timeLabel.hours],
                           @" 小时",
                           [NSString stringWithFormat:@"  %.2ld",(long)timeLabel.minutes],
                           @" 分",
                           [NSString stringWithFormat:@"  %.2ld",(long)timeLabel.seconds],
                           @" 秒"];
    
    return [self dateAttributeWithTexts:textArray];
}

- (NSAttributedString *)dateAttributeWithTexts:(NSArray *)texts{
    
    NSDictionary *datedic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor orangeColor]};
    NSMutableAttributedString *dateAtt = [[NSMutableAttributedString alloc] init];
    
    [texts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *text = (NSString *)obj;
        //说明是时间字符串
        if ([text integerValue] || [text rangeOfString:@"0"].length) {
            [dateAtt appendAttributedString:[[NSAttributedString alloc] initWithString:text attributes:datedic]];
        }else{
            
            UIColor *color = idx%3?[UIColor greenColor]:[UIColor blueColor];
            [dateAtt appendAttributedString:[[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:color}]];
        }
        
    }];
    return dateAtt;
}

- (void)addData{
    NSArray *arr = @[@"2017-2-5 12:10:09",
                      @"2017-3-5 12:10:06",
                      @"2022-7-10 18:6:15",
                      @"2017-8-5 18:10:08",
                     @"2017-10-5 18:10:06",
                     @"2027-7-10 18:6:16",
                     @"2021-8-5 18:14:22",
                     @"2017-9-5 18:10:06",
                     @"2019-10-5 18:15:33",
                     @"2017-6-5 12:16:22",
                     @"2020-7-10 18:6:16",
                     @"2017-8-5 12:09:05",
                     @"2019-9-5 18:10:06",
                     @"2017-10-5 18:10:09",
                     @"2017-8-5 18:10:06",
                     @"2018-9-5 18:10:08",
                     @"2017-10-5 18:10:06",
                     @"2019-8-5 18:10:10",
                     @"2007-10-5 18:10:06",
                     @"2018-8-5 18:10:45",
                     @"2017-9-5 18:10:01",
                     @"2018-10-5 18:10:06",
                     @"2017-8-5 18:14:03",
];
    
    for (int i = 0; i < arr.count; i ++) {
        
        TimeModel *model = [TimeModel new];
        model.endTime = arr[i];
        [self.dataList addObject:model];
    }
    
    //移除过时数据
    //[self removeOutDate];
}

//移除过时数据
- (void)removeOutDate{

    for (NSInteger i = self.dataList.count-1; i >= 0; i--) {
        
        TimeModel *model = self.dataList[i];
        if ([self.countDown isOutDateWithModel:model]) {
            [self.dataList removeObject:model];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
