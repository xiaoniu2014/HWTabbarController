//
//  HWPlusButton.h
//  HWTabbarController
//
//  Created by hw on 15/11/3.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HWPlusButtonSubClassing <NSObject>

@required
+ (instancetype)plusButton;

@optional

/*!
 用来自定义加号按钮的位置，如果不实现默认居中，但是如果 tabbar 的个数是奇数则必须实现该方法，否则 CYLTabBarController 会抛出 exception 来进行提示。
 
 @return CGFloat 用来自定义加号按钮在tabbar中的位置
 *
 */

+ (NSInteger)indexOfPlusButtonInTabBar;

/*!
 该方法是为了调整自定义按钮中心点Y轴方向的位置，建议在按钮超出了 tabbar 的边界时实现该方法。
 
 @return CGFloat 返回值是自定义按钮中心点Y轴方向的坐标除以 tabbar 的高度，如果不实现，会自动进行比对，预设一个较为合适的位置，如果实现了该方法，预设的逻辑将失效。
 *
 */
+ (CGFloat)multiplerInCenterY;

@end

@interface HWPlusButton : UIButton

+ (void)registerSubClass;

@end
