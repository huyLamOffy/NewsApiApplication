//
//  Decodable+Extensions.swift
//  Logistic
//
//  Created by OkieLa Dev on 2/24/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation
import Alamofire

extension Encodable {
    var params: Parameters? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        guard
            let data = try? jsonEncoder.encode(self),
            let requestParameter = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            else {
            return nil
        }
        return requestParameter as? Parameters
    }
}
