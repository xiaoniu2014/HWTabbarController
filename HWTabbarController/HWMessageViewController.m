//
//  HWMessageViewController.m
//  HWTabbarController
//
//  Created by hw on 15/10/27.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWMessageViewController.h"
#import "UITabBar+HWBadge.h"

@interface HWMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HWMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.tabBarItem.badgeValue = @"99";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate =self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 99;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"cell_%ld",(long)indexPath.row];
    return cell;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController.tabBarController.tabBar hideBadgeOnItemIndex:4];
}

@end
