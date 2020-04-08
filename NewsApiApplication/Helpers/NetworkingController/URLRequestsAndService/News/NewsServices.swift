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
 
    func getNews(with route: NewsURLRequests) -> Observable<Result<NewsResponse, APIError>> {
        return clientRequest.requestObject(route: route)
    }
}
