//
//  CEVerificationController.m
//  CountDownFour
//
//  Created by CE on 2017/7/12.
//  Copyright © 2017年 CE. All rights reserved.
//

#import "CEVerificationController.h"
#import "CETimeCountDownLabel.h"
#import "CETimeCountDown.h"
#import "CETimeCountDownDateTool.h"

static NSString *const kBtnTitle = @"点击获取验证码";

@interface CEVerificationController ()<CETimeCountDownDelegate>{
    CETimeCountDown *_countDown;
}

@property (weak, nonatomic) IBOutlet UIButton *verificationBtn;

@end

@implementation CEVerificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.verificationBtn setTitle:kBtnTitle forState:UIControlStateNormal];
}

- (IBAction)verificationBtn:(id)sender {
    //向服务器发送请求
    [self requestData];
}

- (void)requestData{
    //成功接收服务器数据后，进行倒计时
    if (1) {
        self.verificationBtn.userInteractionEnabled = NO;
        [self addTime];
    }
}

- (void)addTime{
    if (!_countDown) {
        _countDown = [CETimeCountDown new];
        _countDown.delegate = self;
    }
    CETimeCountDownLabel *timeLabel = [CETimeCountDownLabel new];
    [_countDown addTimeLabel:timeLabel time:[CETimeCountDownDateTool dateByAddingSeconds:3 timeStyle:CECountDownTimeStyleNormal]];
}

- (void)dateWithTimeLabel:(CETimeCountDownLabel *)timeLabel timeCountDown:(CETimeCountDown *)timeCountDown{
    if (timeLabel.totalSeconds) {
        [self.verificationBtn setTitle:[NSString stringWithFormat:@"(%.2ld)后可重新获取",(long)timeLabel.totalSeconds] forState:UIControlStateNormal];
        [self.verificationBtn setTitle:[NSString stringWithFormat:@"(%.2ld)后可重新获取",(long)timeLabel.totalSeconds] forState:UIControlStateHighlighted];
    }else{
        
        [self.verificationBtn setTitle:kBtnTitle forState:UIControlStateNormal];
        self.verificationBtn.userInteractionEnabled = YES;
    }
}

- (void)dealloc{
    [_countDown destoryTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
