//
//  ABCommonTools.m
//  AlipayBox
//
//  Created by tree on 3/14/15.
//  Copyright (c) 2015 AlipayBox. All rights reserved.
//

#import "ABCommonTools.h"
#import "StoryBoardUtilities.h"



@implementation ABCommonTools


#pragma mark - 显示提示信息

+ (void)showInstrutions:(NSString *)instruction {
    [self showInstrutions:instruction inView:[UIApplication sharedApplication].keyWindow];
}

+ (void)showInstrutions:(NSString *)instruction inView:(UIView *)view {
    // 展示字符串为空，不展示
    if (!instruction || instruction.length == 0) {
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = instruction;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    // 防止弹出框阻塞主线程(1秒后消失)
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        hud.removeFromSuperViewOnHide = YES;
//        [hud hide:YES];
//    });
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    });
    
    
}




#pragma mark - 计算文字高度
+ (CGSize)autoLayoutUILabel:(UILabel *) label basedOnContent:(NSString *)content
{
    return [self autoLayout:label.font withWidth:label.frame.size.width basedOnContent:content];
}

+ (CGSize)autoLayout:(UIFont *)font withWidth:(CGFloat)width basedOnContent:(NSString *)content
{
    CGSize actualsize = CGSizeZero;
    if (IS_IOS7) {
        //get current font attributes
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
        //IOS7 fix: get size that text needs, limit the width
        actualsize =[content boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        actualsize = [content sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    return actualsize;
}

#pragma mark - StoryBoard

+ (UIViewController *)viewControllerForStoryboardWithClass:(id)class {
    return [StoryBoardUtilities viewControllerForStoryboardName:@"Storyboard" class:class];
}


@end
