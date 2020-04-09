//
//  UserDefault+Extensions.swift
//  OkieLa Buyer
//
//  Created by OkieLa Dev on 7/22/19.
//  Copyright © 2019 OkieLa. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum KeyName {
        
        case userPhoneNumber
        case userPassword
        
        var name: String {
            switch self {
            case .userPhoneNumber:
                return "kUserPhoneNumber"
            case .userPassword:
                return "kUserPassword"
            }
        }
    }
}

extension UserDefaults {
    subscript<T>(key: UserDefaults.KeyName) -> T? {
        get {
            return value(forKey: key.name) as? T
        }
        set {
            set(newValue, forKey: key.name)
        }
    }
    
    subscript<T: RawRepresentable>(key: UserDefaults.KeyName) -> T? {
        get {
            if let rawValue = value(forKey: key.name) as? T.RawValue {
                return T(rawValue: rawValue)
            }
            return nil
        }
        set {
            set(newValue?.rawValue, forKey: key.name)
        }
    }
}
