//
//  KeywordArticlesViewModel.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class KeywordArticlesViewModel {
    private(set) lazy var articlesViewControllers: [UIViewController] = {
        KeywordArticle.allCases.map({
            let vc = ArticlesViewController.instance()
            vc.viewModel.request = $0.requestModel
            return vc
        })
    }()
    var index = BehaviorRelay<Int>(value: 0)
}

