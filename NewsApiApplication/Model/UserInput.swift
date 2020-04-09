//
//  UserInput.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

enum UserInput {
    case phone(phone: String?)
    case password(password: String?)
    
    var inputError: InputError? {
        switch self {
        case .phone(let phone):
            guard
                let unwrap = phone,
                unwrap.isValidatePhoneNumber
                else {
                return .invalidatePhone
            }
            return nil
        case .password(let password):
            guard
                let unwrap = password,
                unwrap.count >= 6,
                unwrap.count <= 20
                else {
                    return .invalidatePassword
            }
            return nil
        }
    }
    
    static func checkValidateInput(input: (phone: String, password: String)) -> InputError? {
        if UserInput.password(password: input.password).inputError != nil {
            return .invalidatePassword
        }
        
        if UserInput.phone(phone: input.phone).inputError != nil {
            return .invalidatePhone
        }
        
        return nil
    }
}

enum InputError: Error {
    case invalidatePhone
    case invalidatePassword
    
    var localizedDescription: String {
        switch self {
        case .invalidatePhone:
            return "Số điện thoại không đúng chuẩn"
        case .invalidatePassword:
            return "Mật khẩu không đúng chuẩn"
        }
    }
}
