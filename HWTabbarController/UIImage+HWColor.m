//
//  UIImage+HWColor.m
//  HWTabbarController
//
//  Created by hw on 15/11/3.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "UIImage+HWColor.h"

@implementation UIImage (HWColor)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
