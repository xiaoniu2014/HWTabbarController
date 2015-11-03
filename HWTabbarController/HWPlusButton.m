//
//  HWPlusButton.m
//  HWTabbarController
//
//  Created by hw on 15/11/3.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "HWPlusButton.h"

HWPlusButton<HWPlusButtonSubClassing> *HWExternPublishButton;

@implementation HWPlusButton

+ (void)registerSubClass{
    if ([self conformsToProtocol:@protocol(HWPlusButtonSubClassing)]) {
        Class<HWPlusButtonSubClassing> class = self;
        HWExternPublishButton = [class plusButton];
    }
}

@end
