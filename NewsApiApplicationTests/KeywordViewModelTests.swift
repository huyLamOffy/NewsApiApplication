//
//  KeywordViewModelTests.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import XCTest

class KeywordViewModelTests: XCTestCase {
    var disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
    }
    
    //MARK: - TESTS
    
    func testIndex() {
        let vc = KeywordArticlesViewController()
        let _ = UINavigationController(rootViewController: vc)
        let index = vc.viewModel.index
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            index.accept(3)
            XCTAssertEqual(index.value, vc.keywordSegmented.selectedSegmentIndex)

            vc.keywordSegmented.selectedSegmentIndex = 1
            XCTAssertEqual(index.value, vc.keywordSegmented.selectedSegmentIndex)

        }

        
    }

}
