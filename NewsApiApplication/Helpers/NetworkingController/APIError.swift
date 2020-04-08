//
//  ServiceError.swift
//  network_sample_ios
//
//  Created by Quang Luu on 11/15/17.
//  Copyright © 2017 OFFICIENCE SARL. All rights reserved.
//

import Foundation
import Alamofire

public enum APIError: Error {
    
    case noInternet
    case requestFailed
    case invalidData
    case unauthorized
    case notfound
    case generic
    case internalServerError
    case userInputError
    case custom(message: String)
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request failed"
        case .invalidData: return "Invaid data"
        case .unauthorized: return "Unauthorized"
        case .notfound: return "Not found"
        case .generic: return "Failed"
        case .internalServerError: return "Failed"
        case .userInputError: return "Input error"
        case .noInternet : return "No internet"
        case .custom(let message): return message
        }
    }
}
