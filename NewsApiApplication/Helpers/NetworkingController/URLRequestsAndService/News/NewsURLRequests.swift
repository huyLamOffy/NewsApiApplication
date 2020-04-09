//
//  NewsURLRequests.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import Alamofire

enum NewsURLRequests: RouterURLRequestConvertible {
    
    case getTopHeadline(requestModel: PagingRequestModel<TopHeadlineNewsRequestModel>)
    case getEveryThing(requestModel: PagingRequestModel<EverythingNewsRequestModel>)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getEveryThing:
            return "/v2/everything"
        case .getTopHeadline:
            return "/v2/top-headlines"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getTopHeadline(let requestModel):
            return requestModel.params
        case .getEveryThing(let requestModel):
            return requestModel.params
        }
    }
    
}
