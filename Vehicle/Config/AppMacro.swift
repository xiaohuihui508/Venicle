//
//  AppMacro.swift
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

// MARK:- 页面设计相关
let mNavBarHeight   = CGFloat(44.0)
let mTabBarHeight   = CGFloat((IS_IPHONE_X || IS_IPHONE_XS) ? 83 : 49)
let mScreenBounds   = UIScreen.main.bounds
let mScreenWidth    = UIScreen.main.bounds.width
let mScreenHeight   = UIScreen.main.bounds.height

let mStatusBarHeight    = UIApplication.shared.statusBarFrame.size.height
let mNavHeight          = mNavBarHeight + mStatusBarHeight

let IS_IPHONE_X  = mScreenHeight == 812 ? true : false
let IS_IPHONE_XS = mScreenHeight == 896 ? true : false
let navH = ((IS_IPHONE_X || IS_IPHONE_XS) ? 88 : 64)
let mBottomHeight = ((IS_IPHONE_X || IS_IPHONE_XS) ? 34 : 0)
let mHeight:CGFloat = CGFloat(200 + mBottomHeight)
