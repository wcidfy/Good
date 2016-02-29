//
//  LoadView.h
//  Good
//
//  Created by lxx on 16/2/29.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  登录view
 */
@interface LoadView : UIView
/**
 *  电话号码
 */
@property(nonatomic,strong)UITextField *phoneText;
/**
 *  获取验证码
 */
@property(nonatomic,strong) UIButton *yZbut;
/**
 *  验证码
 */
@property(nonatomic,strong)UITextField *messageText;
/**
 *  登录
 */
@property(nonatomic,strong)UIButton  *logBut;

@end
