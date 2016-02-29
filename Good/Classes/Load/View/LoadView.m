//
//  LoadView.m
//  Good
//
//  Created by lxx on 16/2/29.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LoadView.h"
@interface LoadView()
{
    
    UILabel *phoneLable;
   
}
@end
@implementation LoadView


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        phoneLable=[self getLable];
        phoneLable.text=@"电话号码：";
       
        [self addSubview:phoneLable];
        
        _phoneText=[self getTextFile];
        [self addSubview:_phoneText];
        
        
        _yZbut=[self getBut];
        [_yZbut setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self addSubview:_yZbut];
        
        _messageText =[self getTextFile];
        [self addSubview:_messageText];
        
        
    }

    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(20);
        make.centerY.equalTo(self.centerY).offset(-40);
        make.height.equalTo(40);
        make.width.equalTo(80);
    }];
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLable.right).offset(10);
        make.height.equalTo(40);
        make.right.equalTo(self.right).offset(-20);
        make.top.equalTo(phoneLable.top);
    }];
    
    [_yZbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLable.bottom).offset(20);
        make.left.right.height.equalTo(phoneLable);
    }];
    
    [_messageText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneText.left);
        make.width.height.equalTo(_phoneText);
        make.top.equalTo(_phoneText.bottom).offset(20);
    }];


}
-(UITextField *)getTextFile
{
    UITextField *t=[[UITextField alloc]init];
    [t setFont:[UIFont systemFontOfSize:14]];
    t.textAlignment=NSTextAlignmentLeft;
    t.backgroundColor=[UIColor lightGrayColor];
    return t;



}
-(UILabel *)getLable
{
    UILabel *la=[[UILabel alloc]init];
    la.backgroundColor=[UIColor lightGrayColor];
    [la setFont:[UIFont systemFontOfSize:12]];
    la.textAlignment=NSTextAlignmentCenter;

    return la;
}

-(UIButton *)getBut
{
    UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
    bu.backgroundColor=[UIColor lightGrayColor];
    [bu.titleLabel setFont:[UIFont systemFontOfSize:12]];
    bu.titleLabel.textAlignment=NSTextAlignmentCenter;
    return bu;
}
@end
