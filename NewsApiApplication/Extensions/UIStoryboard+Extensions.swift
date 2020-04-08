//
//  UIStoryboard+Extensions.swift
//  Logistic
//
//  Created by OkieLa Dev on 2/19/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    func initialViewController<T: UIViewController>() -> T {
        return self.instantiateInitialViewController() as! T
    }
}
