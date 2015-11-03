//
//  HWPlusButtonSubClass.m
//  HWTabbarController
//
//  Created by hw on 15/11/3.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWPlusButtonSubClass.h"
#import "ViewController.h"

@implementation HWPlusButtonSubClass

+ (void)load{
    [super registerSubClass];
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

+ (instancetype)plusButton{
    HWPlusButtonSubClass *plusButton = [[HWPlusButtonSubClass alloc] init];
    
    [plusButton setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
    [plusButton setTitle:@"发布" forState:UIControlStateNormal];
    
    [plusButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    plusButton.titleLabel.font = [UIFont systemFontOfSize:9.5];
    [plusButton sizeToFit];
    [plusButton addTarget:plusButton action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    return plusButton;
}

- (void)buttonClick{
    UITabBarController *tabBarController = (UITabBarController *)[[UIApplication sharedApplication].delegate window].rootViewController;
    UINavigationController *nav = tabBarController.selectedViewController;
    ViewController *vc = [[ViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed = YES;
    [nav pushViewController:vc animated:YES];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 控件大小,间距大小
    CGFloat const imageViewEdge   = self.bounds.size.width * 0.6;
    CGFloat const centerOfView    = self.bounds.size.width * 0.5;
    CGFloat const labelLineHeight = self.titleLabel.font.lineHeight;
    CGFloat const verticalMarginT = self.bounds.size.height - labelLineHeight - imageViewEdge;
    CGFloat const verticalMargin  = verticalMarginT / 2;
    
    // imageView 和 titleLabel 中心的 Y 值
    CGFloat const centerOfImageView  = verticalMargin + imageViewEdge * 0.5;
    CGFloat const centerOfTitleLabel = imageViewEdge  + verticalMargin * 2 + labelLineHeight * 0.5 + 5;
    
    //imageView position 位置
    self.imageView.bounds = CGRectMake(0, 0, imageViewEdge, imageViewEdge);
    self.imageView.center = CGPointMake(centerOfView, centerOfImageView);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //title position 位置
    self.titleLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, labelLineHeight);
    self.titleLabel.center = CGPointMake(centerOfView, centerOfTitleLabel);
}

#pragma mark - CYLPlusButtonSubclassing

//+ (NSUInteger)indexOfPlusButtonInTabBar {
//    return 4;
//}

+ (CGFloat)multiplerInCenterY {
    return  0.3;
}

@end
