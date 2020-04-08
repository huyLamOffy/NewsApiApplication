//
//  ArticlesViewModelTests.swift
//  NewsApiApplicationTests
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import XCTest
import RxSwift

class ArticlesViewModelTests: XCTestCase {
    var disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        ReachabilityManager.shared.startMonitoring()
    }
    
    //MARK: - TESTS
    func testFetchArticles() {
        let request = NewsURLRequests.getTopHeadline(requestModel: PagingRequestModel<TopHeadlineNewsRequestModel>(requestModel: TopHeadlineNewsRequestModel()))
        let viewModel = ArticlesViewModel()
        viewModel.request = request
        let expectation = XCTestExpectation(description: "should call completion handler in 10s")
        viewModel.articles.asDriver()
        .skip(1)
            .drive(onNext: { articles in
                print(articles.first)
                XCTAssertFalse(articles.isEmpty)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            viewModel.loadArticles()
        }
        wait(for: [expectation], timeout: 10)

    }

}
