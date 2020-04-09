//
//  Error+Extensions.swift
//  Logistic
//
//  Created by OkieLa Dev on 3/16/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation

extension Error {
    var message: String {
        var message = localizedDescription
        if let apiError = self as? APIError {
            message = apiError.localizedDescription
        }
        return message
    }
}
