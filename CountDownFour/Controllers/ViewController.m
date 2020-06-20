//
//  ViewController.m
//  CountDownFour
//
//  Created by CE on 2017/7/10.
//  Copyright © 2017年 CE. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "TableViewGroupController.h"
#import "CECollectionViewController.h"
#import "CETimeCountDownLabel.h"
#import "CEVerificationController.h"

@interface ViewController ()<CETimeCountDownDelegate>

@property(nonatomic,strong) CETimeCountDown * countDown;

@property (weak, nonatomic) IBOutlet CETimeCountDownLabel *oneTimeLabel;

@property (weak, nonatomic) IBOutlet CETimeCountDownLabel *twoTimeLabel;
@property (weak, nonatomic) IBOutlet CETimeCountDownLabel *threeTimeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.oneTimeLabel.jj_description = @"活动已经结束!😄😄";
    self.threeTimeLabel.jj_description = @"😄😄活动已经结束!";
    
    self.countDown.delegate = self;
    //注意⚠️：如果传入非2020-7-12 20:20:20时间格式，要先设置时间格式，在进行视图添加
    self.countDown.timeStyle = CECountDownTimeStyleNormal;
    [self.countDown addTimeLabel:self.oneTimeLabel time:[self dateByAddingSeconds:-10]];
    [self.countDown addTimeLabel:self.twoTimeLabel time:[self dateByAddingSeconds:102]];
    [self.countDown addTimeLabel:self.threeTimeLabel time:[self dateByAddingSeconds:300]];
    // Do any additional setup after loading the view, typically from a nib.
    
}


/**
 在当前的时间上追加秒数

 @param seconds 追加秒数
 @return 时间
 */
- (NSString *)dateByAddingSeconds: (NSInteger)seconds{

    NSTimeInterval aTimeInterval = [NSDate timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *timeStr = [formatter stringFromDate:newDate];
    return timeStr;
}

- (CETimeCountDown *)countDown{
    
    if (!_countDown) {

        _countDown = [[CETimeCountDown alloc] init];
    }
    return _countDown;
}

- (IBAction)tableViewPlainClick:(id)sender {
    
    [self.navigationController pushViewController:[TableViewController new] animated:YES];
}
- (IBAction)tableViewGroupedClick:(id)sender {
    
    [self.navigationController pushViewController:[TableViewGroupController new] animated:YES];
}
- (IBAction)collectionViewClick:(id)sender {
    
       [self.navigationController pushViewController:[CECollectionViewController new] animated:YES];
}
- (IBAction)verificationBtnClick:(id)sender {
    
    CEVerificationController *verCon = [[CEVerificationController alloc] initWithNibName:NSStringFromClass([CEVerificationController class]) bundle:nil];
    [self.navigationController pushViewController:verCon animated:YES];
}

- (void)outDateTimeLabel:(CETimeCountDownLabel *)timeLabel timeCountDown:(CETimeCountDown *)timeCountDown{

    if ([timeLabel isEqual:self.oneTimeLabel]) {
        self.oneTimeLabel.textColor = [UIColor redColor];
    }
     else if ([timeLabel isEqual:self.twoTimeLabel]) {
        self.twoTimeLabel.textColor = [UIColor orangeColor];
     }else{
         self.threeTimeLabel.textColor = [UIColor greenColor];
     }
}

- (BOOL)isCustomizeText{
    return YES;
}

- (NSString *)dateWithDay:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute seconds:(NSInteger)seconds timeLabel:(CETimeCountDownLabel *)timeLabel timeCountDown:(CETimeCountDown *)timeCountDown{
    NSString *string = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld:%.2ld",(long)day,(long)hour,(long)minute,(long)seconds];
    return string;
}

- (void)dealloc{
    [self.countDown destoryTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
