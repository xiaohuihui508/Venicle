//
//  YFTabBarControllerConfig.m
//  I4U
//
//  Created by Darcy on 2019/4/15.
//  Copyright © 2019 CY. All rights reserved.
//

#import "YFTabBarControllerConfig.h"

#import "HomeVC.h"
#import "AnalyzeVC.h"
#import "MineVC.h"


static CGFloat const YFTabBarControllerHeight = 40.f;

@implementation YFBaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBar.barTintColor = kConfigColor;
        [self.navigationBar setShadowImage:[UIImage imageWithColor:kConfigColor]];//导航栏分割线的颜色
        NSDictionary *naviTitleDic = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};//导航栏字体的颜色和大小
        UINavigationBar *navBar = [UINavigationBar appearance]; //全世界都知道
        [navBar setTitleTextAttributes:naviTitleDic];
        
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
       
//        if ([viewController isKindOfClass:[PYSearchViewController class]]) {
//        } else {
            UIButton *backBtn = [[UIButton alloc] init];
            backBtn.frame = CGRectMake(0, 0, 40, 44);
            [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
            [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
            [backBtn setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
            backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
            
//        }
       [UITabBar appearance].translucent = NO;
        //        if ([viewController isKindOfClass:[LookHeadViewController class]]) {
        //            [backBtn setImage:[UIImage imageNamed:@"head_nav_back_white"] forState:UIControlStateNormal];
        //        } else {
        //            [backBtn setImage:[UIImage imageNamed:@"head_nav_back"] forState:UIControlStateNormal];
        //        }
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (void)back:(UIButton *)sender {
//    [RTNetworkManager cancelAllRequest];
    [self popViewControllerAnimated:YES];
}

@end

//UITabbar
@interface YFTabBarControllerConfig ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) YFTabBerViewController *tabBarController;

@end

@implementation YFTabBarControllerConfig

- (YFTabBerViewController *)tabBarController {
    if (_tabBarController == nil) {
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
         * 更推荐后一种做法。
         */
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetMake(0, -3);//UIOffsetMake(0, MAXFLOAT); UIOffsetZero
        
        YFTabBerViewController *tabBarController = [YFTabBerViewController tabBarControllerWithViewControllers:self.viewControllers
                                                                                         tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                                   imageInsets:imageInsets
                                                                                       titlePositionAdjustment:titlePositionAdjustment];
        tabBarController.selectedIndex = 0;
        
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    HomeVC *firstViewController = [[HomeVC alloc] init];
    UIViewController *firstNavigationController = [[YFBaseNavigationController alloc] initWithRootViewController:firstViewController];
    
    AnalyzeVC *analyVC = [[AnalyzeVC alloc] init];
    UIViewController *analyNav = [[YFBaseNavigationController alloc] initWithRootViewController:analyVC];
    
    MineVC *mineVC = [[MineVC alloc] init];
    UIViewController *mineNav = [[YFBaseNavigationController alloc] initWithRootViewController:mineVC];
    
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 analyNav,
                                 mineNav
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 YFTabBarItemTitle :[Language getText:@"Home"],
                                                 YFTabBarItemImage : @"tab_home_n",
                                                 YFTabBarItemSelectedImage : @"tab_home_h",
                                                 };
    NSDictionary *workTabBarItemsAttributes = @{
                                                  YFTabBarItemTitle :[Language getText:@"Analysis"],
                                                  YFTabBarItemImage : @"tab_analysis_n",
                                                  YFTabBarItemSelectedImage : @"tab_analysis_h",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 YFTabBarItemTitle :[Language getText:@"Setting"],
                                                 YFTabBarItemImage : @"tab_setting_n",
                                                 YFTabBarItemSelectedImage : @"tab_setting_h",
                                                 };
    
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       workTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(YFTabBerViewController *)tabBarController {
    //自定义tabbar Aapperance
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = kConfigNorColor;
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:9];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = kConfigColor;
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:9];
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    UITabBar *tabBar = [UITabBar appearance];
    tabBar.translucent = YES;
    [tabBar setBackgroundImage:[UIImage imageWithColor:kTabbarBackColor]];
    [tabBar setBackgroundColor:kTabbarBackColor];
    [tabBar setShadowImage:[UIImage imageWithColor:kTabbarLingColor]];//下面的分割线
    
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:YFTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    CGFloat tabBarHeight = YFTabBarControllerHeight;
    CGSize selectionIndicatorImageSize = CGSizeMake(YFTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self yf_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor yellowColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
