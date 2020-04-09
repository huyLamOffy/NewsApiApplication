//
//  ArticlesViewController.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxCocoa

class ArticlesViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    lazy var viewModel: ArticlesViewModel = { ArticlesViewModel() }()
    
    // MARK: - View Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadArticles()

    }
    
    override func configureUI() {
        super.configureUI()
        
        title = "Articles"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.onNibRegister(type: ArticleCell.self)
    }
    
    override func dataBinding() {
        super.dataBinding()
        
        viewModel.progressStatus.asDriver(onErrorJustReturn: .complete)
            .drive(rx.progressStatus)
            .disposed(by: disposeBag)
        
        viewModel.articles.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }

}

//MARK: - Table View

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleCell = tableView.onDequeue(idxPath: indexPath)
        cell.article = viewModel.articles.value[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ArticleDetailViewController.instance()
        vc.viewModel.article.accept(viewModel.articles.value[indexPath.row])
        
        push(viewController: vc)
    }
}

