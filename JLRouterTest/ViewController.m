//
//  ViewController.m
//  JLRouterTest
//
//  Created by Lfur on 2018/6/22.
//  Copyright © 2018年 Lfur. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <JLRoutes.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnTap:(id)sender {
    NSURL *nextPageUrl = [NSURL URLWithString:@"Dream.JLRouterTest://native/vc/pushTo//SecondController"]; //中文需要转化
    [[UIApplication sharedApplication] openURL:nextPageUrl options:@{@"param1":@"参数1", @"param2":@100} completionHandler:^(BOOL success) {
        NSLog(@"第一个页面跳转到第二个页面回掉成功");
    }];
}


@end
