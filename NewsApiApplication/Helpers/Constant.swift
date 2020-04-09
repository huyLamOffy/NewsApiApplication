//
//  Constant.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

enum Constant {
    static var baseURL: String { "https://newsapi.org" }
    static var apiKey: String { "8dbf024c03ab48bea263ba418a5b5421" }
    static var pageSize: Int {
        return isIpad ? 30 : 15
    }
    static var blueThemeColor: UIColor { UIColor(red: 17/255, green: 113/255, blue: 138/255, alpha: 1.0) }
}
