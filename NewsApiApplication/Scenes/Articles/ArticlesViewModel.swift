//
//  ArticlesViewModel.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ArticlesViewModel {
    var progressStatus = PublishSubject<ProgressStatus>()
    var articles = BehaviorRelay<[Article]>(value: [])
    let service = NewsService()
    var request: NewsURLRequests!
    let disposeBag = DisposeBag()
    
    func loadArticles() {
        progressStatus.onNext(.loading(message: nil))
        service.getNews(with: request)
            .subscribe(onNext: { [weak self] (result) in

                self?.progressStatus.onNext(.complete)
                switch result {
                case .success(let newsResponse):
                    guard !newsResponse.isError else {
                        self?.progressStatus.onNext(.failed(message: newsResponse.errorMessage!))
                        return
                    }
                    var newArticles = self?.articles.value
                    newArticles?.append(contentsOf: newsResponse.articles ?? [])
                    self?.articles.accept(newArticles ?? [])
                case.failure(let error):
                    self?.progressStatus.onNext(.failed(message: error.localizedDescription))
                }
            })
            .disposed(by: disposeBag)
    }
}
