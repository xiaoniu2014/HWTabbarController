//
//  HWMineViewController.m
//  HWTabbarController
//
//  Created by hw on 15/10/27.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWMineViewController.h"
#import "UITabBar+HWBadge.h"


@interface HWMineViewController ()

@end

@implementation HWMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController.tabBarController.tabBar showBadgeOnItemIndex:4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
