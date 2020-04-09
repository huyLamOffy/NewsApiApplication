//
//  AppearanceUIHelper.swift
//  Logistic
//
//  Created by OkieLa Dev on 3/16/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import UIKit

enum AppearanceUIHelper {
    static func customizeAppearance() {
        let blueThemeColor = UIColor(red: 17/255, green: 113/255, blue: 138/255, alpha: 1.0)
        // Navigation Bar
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = blueThemeColor
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
        UINavigationBar.appearance().barStyle = .black

        // Tool Bar
        UIToolbar.appearance().barTintColor = blueThemeColor
        UIToolbar.appearance().tintColor = UIColor.white

        // UISegmentedControl
        UISegmentedControl.appearance().tintColor = .white

        // TabBar
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = blueThemeColor
        UITabBar.appearance().tintColor = UIColor.white
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = UIColor.white.withAlphaComponent(0.6)
        }
        UITabBarItem.appearance().setTitleTextAttributes([
        NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.6)
        ], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([
        NSAttributedString.Key.foregroundColor: UIColor.white
        ], for: .selected)
        
        if isIphone {
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        }
    }
}
