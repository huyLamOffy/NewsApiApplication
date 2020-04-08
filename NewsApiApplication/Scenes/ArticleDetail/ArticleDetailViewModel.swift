//
//  ArticleDetailViewModel.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
    
class ArticleDetailViewModel {
    var article = BehaviorRelay<Article?>(value: nil)
}
