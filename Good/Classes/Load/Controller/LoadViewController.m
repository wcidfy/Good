//
//  LoadViewController.m
//  Good
//
//  Created by lxx on 16/2/29.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LoadViewController.h"
#import "LoadView.h"
#import <SMS_SDK/SMSSDK.h>
@interface LoadViewController ()
@property(nonatomic,strong)LoadView *load;
@property(nonatomic, assign) NSInteger secondsCountDown;
@property(nonatomic, strong) NSTimer *countDownTimer;

@end

@implementation LoadViewController
- (void)loadView
{
    [super loadView];
    _load=[[LoadView alloc]init];
    self.view=_load;

    [self butClick];
   }
#pragma mark 添加按钮点击方法
-(void)butClick
{
    [_load.yZbut addTarget:self action:@selector(yZbutClick) forControlEvents:UIControlEventTouchUpInside];
    [_load.logBut addTarget:self action:@selector(logButClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma  mark 获取验证码
-(void)yZbutClick
{
    
  

    _secondsCountDown=10;
    _countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_load.phoneText.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
                                         if (!error) {
                                              NSLog(@"获取验证码成功");
//                                              [_load.yZbut setTitle:@"重新发送" forState:UIControlStateNormal];
                                         }else
                                         {
                                         NSLog(@"错误信息：%@",error);
                                             [ABCommonTools showInstrutions:[NSString stringWithFormat:@"%@",error.userInfo[error.domain]] inView:self.view];
                                             [_load.yZbut setTitle:@"发送验证码" forState:UIControlStateNormal];
                                             [_countDownTimer invalidate];
                                         }
       
                                     }];

}

-(void)timeFireMethod
{
   

    [_load.yZbut setTitle:[NSString stringWithFormat:@"重发%ld",(long)_secondsCountDown] forState:UIControlStateNormal];
    _secondsCountDown--;
    _load.yZbut.enabled=NO;
    if ([_load.yZbut.titleLabel.text isEqualToString:@"重发0"]) {
        [_countDownTimer invalidate];
        [_load.yZbut setTitle:@"重新发送" forState:UIControlStateNormal];
        _load.yZbut.enabled=YES;

    }

}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
}
#pragma mark 登录按钮点击
-(void)logButClick
{
    if(_load.phoneText.text.length!=11)
    {
        [ABCommonTools showInstrutions:@"电话号码有误" inView:self.view];

    
    }else
    {
    [SMSSDK commitVerificationCode:_load.messageText.text phoneNumber:_load.phoneText.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
        }
        else
        {
            NSLog(@"错误信息:%@",error);
//            [NSString stringWithFormat:@"%@",error.userInfo[error.domain]]
            [ABCommonTools showInstrutions:@"验证码错误" inView:self.view];
        }
        
    }];
    }
}
#pragma mark  移除键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    if (![_load.phoneText isExclusiveTouch]||![_load.messageText isExclusiveTouch]) {
        [_load.phoneText resignFirstResponder];
         [_load.messageText resignFirstResponder];
        
    }

}
@end
