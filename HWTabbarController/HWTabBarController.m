//
//  HWTabBarController.m
//  HWTabbarController
//
//  Created by hw on 15/11/3.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWTabBarController.h"

NSUInteger HWTabBarItemsCount = 0;

@interface HWTabBarController ()

@end

@implementation HWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTabBar];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    HWTabBarItemsCount = self.viewControllers.count;
}

- (void)setUpTabBar{
    [self setValue:[[HWTabBar alloc] init] forKey:@"tabBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
