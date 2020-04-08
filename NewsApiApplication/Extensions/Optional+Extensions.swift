//
//  Optional+Extensios.swift
//  Logistic
//
//  Created by OkieLa Dev on 2/21/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation


extension Optional where Wrapped: Collection {
    var isEmptyOrNil: Bool {
        switch self {
        case let collection?:
            return collection.isEmpty
        case nil:
            return true
        }
    }
}


extension Optional where Wrapped == String {
    var unwrap: String {
        return self ?? "-"
    }
}
