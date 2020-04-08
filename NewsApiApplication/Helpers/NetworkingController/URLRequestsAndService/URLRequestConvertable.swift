//
//  URLRequestConvertable.swift
//  Logistic
//
//  Created by OkieLa Dev on 3/10/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation
import Alamofire

/// Router request convertible
protocol RouterURLRequestConvertible: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

extension RouterURLRequestConvertible {

    func asURLRequest() throws -> URLRequest {
        let url = try Self.baseURLString.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)

        return urlRequest
    }
}
