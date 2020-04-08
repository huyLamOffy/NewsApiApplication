//
//  Utilities.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

//MARK: - GADGETS

public func run(after: Double = 1.0, on queue: DispatchQueue = .main, action: @escaping (() -> Void)) {
    queue.asyncAfter(deadline: .now() + after, execute: action)
}

//MARK: - DEVICES

public var isIphone: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
}

public var isIpad: Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}

public var hasTopNotch: Bool {
    if #available(iOS 13.0,  *) {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
    } else {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        } else {
           return false
        }
    }
}
