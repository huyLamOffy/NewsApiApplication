//
//  NewsServices.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift

struct NewsService {
    var clientRequest = APIRequest()
 
    func getHeadlineNews(with requestModel: PagingRequestModel<TopHeadlineNewsRequestModel>) -> Observable<Result<NewsResponse, APIError>> {
            let route = NewsURLRequests.getTopHeadline(requestModel: requestModel)
            return clientRequest.requestObject(route: route)
    }
}
