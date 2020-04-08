//
//  PagingRequestModel.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import Alamofire

struct PagingRequestModel<RequestModel: Encodable>: Encodable {
    var page = 1
    var pageSize = Constant.pageSize
    var requestModel: RequestModel
    
    var params: Parameters? {
        var params = requestModel.params
        params?["page"] = page
        params?["pageSize"] = pageSize
        return params
    }
}
