//
//  ArticleDetailViewController.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class ArticleDetailViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    lazy var viewModel: ArticleDetailViewModel = { ArticleDetailViewModel() }()

    // MARK: - View Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func configureUI() {
        super.configureUI()
        
        linkLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkLabelTapped(_:))))
    }
    
    override func dataBinding() {
        super.dataBinding()
        
        viewModel.article.asDriver()
            .drive(onNext: { [weak self] article in
                guard let article = article else { return }
                self?.articleImageView.kfDownloaded(fromUrl: article.urlToImage)
                self?.titleLabel.text = article.title
                self?.contentLabel.text = article.content
                self?.linkLabel.text = article.url?.absoluteString
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Events
    
    @objc private func linkLabelTapped(_ sender: Any) {
        if let url = viewModel.article.value?.url {
            UIApplication.shared.open(url)
        }
    }
}
