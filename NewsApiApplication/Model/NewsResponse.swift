//
//  NewsResponse.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

struct NewsResponse: Decodable {
    var status: String
    var totalResults: Int?
    var articles: [Article]?
    private var message: String?
    
    var isError: Bool {
        return status == "error"
    }
    
    var errorMessage: String? {
        return message
    }
}

struct Article: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
    var content: String?
    var publishedAt: String?
}
