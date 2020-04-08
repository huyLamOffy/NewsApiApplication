//
//  ViewController.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    let service = NewsService()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        run(after: 3.0) {
            let requestModel = PagingRequestModel<TopHeadlineNewsRequestModel>(requestModel: TopHeadlineNewsRequestModel())
            self.service.getHeadlineNews(with: requestModel)
                .subscribe { (result) in
                    print(result)
            }.disposed(by: self.disposeBag)
            
        }
    }


}

