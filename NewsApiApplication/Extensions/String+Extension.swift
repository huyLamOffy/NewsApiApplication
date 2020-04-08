//
//  String+Extension.swift
//  Logistic
//
//  Created by OkieLa Dev on 2/19/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func lowercasedFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }
    
    mutating func lowercasedFirstLetter() {
        self = self.lowercasedFirstLetter()
    }
}

extension String {
    typealias AlertActionHandler = ((UIAlertAction) -> Void)

    func alertAction(style: UIAlertAction.Style = .default, handler: AlertActionHandler? = nil) -> UIAlertAction {
        return UIAlertAction(title: self, style: style, handler: handler)
    }
}
