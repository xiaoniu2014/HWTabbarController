//
//  AppDelegate.m
//  HWTabbarController
//
//  Created by hw on 15/10/27.
//  Copyright © 2015年 hongw. All rights reserved.
//

#import "AppDelegate.h"

#import "HWMainViewController.h"
#import "HWSameCityViewController.h"
#import "HWMessageViewController.h"
#import "HWMineViewController.h"

#import "HWTabBarController.h"

@interface AppDelegate ()
@property (nonatomic,strong) UITabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self resetTabbar];
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)resetTabbar{
    HWMainViewController *mainVC = [[HWMainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    HWSameCityViewController *sameCityVC = [[HWSameCityViewController alloc] init];
    UINavigationController *sameCityNav = [[UINavigationController alloc] initWithRootViewController:sameCityVC];

    
    HWMessageViewController *messageVC = [[HWMessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];

    
    HWMineViewController *mineVC = [[HWMineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    [self setControllerAttribute:mainNav title:@"首页" image:@"home"];
    [self setControllerAttribute:sameCityNav title:@"同城" image:@"mycity"];
    [self setControllerAttribute:messageNav title:@"消息" image:@"message"];
    [self setControllerAttribute:mineNav title:@"我的" image:@"account"];
    
    HWTabBarController *tabBarController = [[HWTabBarController alloc] init];
    tabBarController.viewControllers = @[mainNav,
                                         sameCityNav,
                                         messageNav,
                                         mineNav
                                         ];
    self.tabBarController = tabBarController;
    
    [self setTabBarAttribute];
}

- (void)setControllerAttribute:(UINavigationController *)controller title:(NSString *)title image:(NSString *)image{
    controller.tabBarItem.title = title;
    NSMutableString *normalImageName = [NSMutableString stringWithString:image];
    [normalImageName appendString:@"_normal"];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    controller.tabBarItem.image = normalImage;
    
    
    NSMutableString *selectedImageName = [NSMutableString stringWithString:image];
    [selectedImageName appendString:@"_highlight"];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = selectedImage;
}

- (void)setTabBarAttribute{
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor darkGrayColor]} forState:UIControlStateSelected];
    
    UITabBar *tabBar = [UITabBar appearance];
//    去掉tabBar自带的顶部阴影
    [tabBar setShadowImage:[[UIImage alloc] init]];
    
//    设置选中颜色
//    [tabBar setSelectionIndicatorImage:[AppDelegate imageFromColor:[UIColor greenColor] forSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)/5.0f, 49) withCornerRadius:0]];
//    设置背景图片
//    [tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background_os7"]];
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
