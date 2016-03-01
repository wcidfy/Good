//
//  MainViewController.m
//  Good
//
//  Created by lxx on 16/2/29.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "NavViewController.h"
@interface MainViewController ()
@property(nonatomic,strong)NSMutableArray *items;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor redColor];
    [self AddControllers];
  
}
#pragma mark 添加所有控制器
-(void)AddControllers
{
    HomeViewController *home=[[HomeViewController alloc]init];
    [self addOneController:home Image:@"" SelectImage:@"" Title:@"首页"];
    MessageViewController *message=[[MessageViewController alloc]init];
    [self addOneController:message Image:@"" SelectImage:@"" Title:@"消息"];

}
#pragma mark 添加子控制器方法
-(void)addOneController:(UIViewController *)vc Image:(NSString *)image SelectImage:(NSString *)selectedImage Title:(NSString *)titlt
{
    vc.tabBarItem.image=[UIImage imageNamed:image];
    vc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    vc.tabBarItem.title=titlt;
    [self.items addObject:vc.tabBarItem];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];


}
@end
