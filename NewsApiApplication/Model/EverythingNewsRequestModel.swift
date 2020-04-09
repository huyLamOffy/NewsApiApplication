//
//  EverythingNewsRequestModel.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

struct EverythingNewsRequestModel: Encodable {
    var keyword: KeywordArticle

    enum CodingKeys: String, CodingKey {
        case keyword = "q"
    }
    
}
