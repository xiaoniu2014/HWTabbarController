//
//  HWSameCityViewController.m
//  HWTabbarController
//
//  Created by hw on 15/10/27.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWSameCityViewController.h"
#import "ViewController.h"

@interface HWSameCityViewController ()

@end

@implementation HWSameCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(20, 200, 100, 44);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

- (void)buttonClick:(UIButton *)button{
    
    ViewController *vc = [[ViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
