//
//  RoutersManager.m
//  JLRouterTest
//
//  Created by Lfur on 2018/6/25.
//  Copyright © 2018年 Lfur. All rights reserved.
//  本文件主要 用于注册url 和 统一管理

//  你可以定义一些公共页面跳转， 也可以一个页面的跳转url做一个闭包块。

#import "RoutersManager.h"
#import "AppDelegate.h"
#import <JLRoutes.h>

@interface RoutersManager()
@property (nonatomic, strong)JLRoutes  *globalRout;
@property (nonatomic, strong) AppDelegate *app;
@end

@implementation RoutersManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.globalRout = [JLRoutes globalRoutes];
        [self addPushRouter];
        self.app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return self;
}

/**
 * 设置routers
 */
+ (void)setupRouters{
    [[RoutersManager alloc] init];
}

#pragma mark - 跳转页面（push）
//通用Push 跳转
-(void)addPushRouter{
    __block typeof(self) weakSelf = self;
    [self.globalRout addRoute:@"native/vc/pushTo/:controller/：navTitle/*" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        UIViewController *vc = [[NSClassFromString(parameters[@"controller"]) alloc] init];  //构建控制器
        vc.navigationItem.title = parameters[@"navTitle"];
        [[weakSelf.app currentViewController].navigationController pushViewController:vc animated:YES];
        return YES;
    }];
}

//一个URL 对应一个闭包块
-(void)addPushRouterForOne{
    __block typeof(self) weakSelf = self;
    [self.globalRout addRoute:@"native/vc/pushTo/:detailController/:params" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        UIViewController *vc = [[NSClassFromString(parameters[@"detaiController"]) alloc] init];
        NSDictionary *paras = parameters[@"params"];    // 目标Controller需要的一些参数
        // 将paras 转为model 传入Conroller 
        [[weakSelf.app currentViewController].navigationController pushViewController:vc animated:YES];
        return YES;
    }];
}

- (void)dealloc
{
   
}
@end
