//
//  AppConfig.h
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

#ifdef DEBUG
#define N_HostSiteMain @"https://dev.i4u.net.cn"
#else
///正式环境主站点（勿动)
#define N_HostSiteMain @"https://www.i4u.net.cn"
#endif

///MARK:APP基本色=========
#define kConfigNorColor    mHexColor(0x8C8E9F) //主题未选中的颜色
#define kConfigColor       mHexColor(0xB72F24) //主题色
#define kLineColor         mHexColor(0xCFD0D6) //分割线的颜色
#define kBottomColor       mHexColor(0xF8F8F8) //背景色
#define kBlackColor        mHexColor(0x363848) //主标题颜色值
#define kSubTitleColor     mHexColor(0x8C8E9F) //副标题颜色值
#define kTabbarLingColor   mHexColorAlpha(0x000000,0.25) //导航栏分割线和tabbar分割线
#define kTabbarBackColor   mHexColorAlpha(0xFAFAFA,0.9)//tabbar的背景色
#define kWhiteColor        mHexColor(0xFFFFFF) //白色的字体颜色


//mark: app 基本字体大小
#define kFont11             [UIFont systemFontOfSize:12]
#define kFont12             [UIFont systemFontOfSize:12]
#define kFont13             [UIFont systemFontOfSize:13]
#define kFont14             [UIFont systemFontOfSize:14]
#define kFont15             [UIFont systemFontOfSize:15]
#define kFont16             [UIFont systemFontOfSize:16]
#define kFont17             [UIFont systemFontOfSize:17]

// 当图标数据为空时,是否可以点击查看大图
#define kCanShowNoData    1



//rgb颜色转换（16进制->10进制）
#define mHexColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

#define mHexColorAlpha(hex,a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a]

#endif /* AppConfig_h */
