//
//  Definable.swift
//  Logistic
//
//  Created by OkieLa Dev on 2/19/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation
import UIKit

protocol Definable {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension Definable where Self: UITableViewCell {
    static var cellId: String {
        return Self.nibName.lowercasedFirstLetter()
    }
}

extension Definable where Self: UICollectionViewCell {
    static var cellId: String {
        return Self.nibName.lowercasedFirstLetter()
    }
}

extension Definable where Self: UICollectionReusableView {
    static var cellId: String {
        return Self.nibName.lowercasedFirstLetter()
    }
}

extension Definable where Self: UITableViewHeaderFooterView {
    static var cellId: String {
           return Self.nibName.lowercasedFirstLetter()
       }
}

extension UIView: Definable {
    static var nibName: String {
        return "\(self)"
    }
    
    static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
