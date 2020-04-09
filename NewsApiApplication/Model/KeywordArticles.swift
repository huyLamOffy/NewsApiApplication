//
//  KeywordArticles.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

enum KeywordArticle: String, Encodable, CaseIterable {
    case bitcoin, apple, earthquake, animal
    
    var displayTitle: String {
        switch self {
        case .bitcoin:
            return "Bitcoin"
        case .apple:
            return "Apple"
        case .earthquake:
            return "Earthquake"
        case .animal:
            return "Animal"
        }
    }
    
    var requestModel: NewsURLRequests {
        let everythingNewsRequestModel = EverythingNewsRequestModel(keyword: self)
        
        return NewsURLRequests.getEveryThing(requestModel: PagingRequestModel(requestModel: everythingNewsRequestModel))
        
    }
}
