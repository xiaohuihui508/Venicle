//
//  PublicMacro.h
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#ifndef PublicMacro_h
#define PublicMacro_h

#pragma mark - 判断当前设备
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define iPhone3                   ([UIScreen mainScreen].bounds.size.height < 480)
#define iPhone4                   ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5                   ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6                   ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6p                  ([UIScreen mainScreen].bounds.size.height == 736)
#define IS_IPHONE_X (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)
#define IS_IPHONE_XS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 896.0f)


#define m6PScale              (mScreenWidth/1242.0)
#define m6Scale               (mScreenWidth/750.0)
#define m5Scale               (mScreenWidth/640.0)
#define k6Scale               (mScreenWidth/375.0)

//定义屏幕框 高
#define  mScreenHeight                  [UIScreen mainScreen].bounds.size.height
#define  mScreenWidth                   [UIScreen mainScreen].bounds.size.width


#define statusBarH (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))
#define statusBar  ((IS_IPHONE_X ||IS_IPHONE_XS) ? 24 : 0)
#define NaviHeight (statusBarH + 44)
#define TABBARHEIGHT ((IS_IPHONE_X ||IS_IPHONE_XS) ? 83 : 49)
#define BottomHeight ((IS_IPHONE_X ||IS_IPHONE_XS) ? 34 : 0)

#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)
#define iOS10Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)


#pragma mark --- 方法的简写 ----
#define mWeakSelf  __weak typeof (self)weakSelf = self;
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define FUWindow [UIApplication sharedApplication].delegate.window

/* 封装归档keyedArchiver操作 */
#define mWZLSERIALIZE_ARCHIVE(__objToBeArchived__, __key__, __filePath__)    \
\
NSMutableData *data = [NSMutableData data]; \
NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];   \
[archiver encodeObject:__objToBeArchived__ forKey:__key__];    \
[archiver finishEncoding];  \
[data writeToFile:__filePath__ atomically:YES]

/* 封装反归档keyedUnarchiver操作 */
#define mWZLSERIALIZE_UNARCHIVE(__objToStoreData__, __key__, __filePath__)   \
NSMutableData *dedata = [NSMutableData dataWithContentsOfFile:__filePath__]; \
NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:dedata];  \
__objToStoreData__ = [unarchiver decodeObjectForKey:__key__];  \
[unarchiver finishDecoding]

#define safeStringFromDic(object, key) ![object isKindOfClass:[NSDictionary class]] ? @"":![[object objectForKey:key] respondsToSelector:@selector(boolValue)] ? @"" :[[NSString stringWithFormat:@"%@", [object objectForKey:key]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]


#endif /* PublicMacro_h */
