//
//  UITabBar+HWBadge.h
//  HWTabbarController
//
//  Created by hw on 15/11/3.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (HWBadge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
