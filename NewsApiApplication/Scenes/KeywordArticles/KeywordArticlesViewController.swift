//
//  KeywordArticlesViewController.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class KeywordArticlesViewController: UIPageViewController {
    
    // MARK: - Properties
    
    lazy var viewModel = { KeywordArticlesViewModel() }()
    var keywordSegmented = UISegmentedControl()
    let disposeBag = DisposeBag()
    
    // MARK: - View Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dataBinding()
    }
    
    func configureUI() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        dataSource = self
        delegate = self
        
        keywordSegmented = UISegmentedControl(items: KeywordArticle.allCases.map({$0.displayTitle}))
        keywordSegmented.sizeToFit()
        keywordSegmented.selectedSegmentIndex = 0
        navigationItem.titleView = keywordSegmented
    }
    
    func dataBinding() {
        
        viewModel.index.asDriver()
            .distinctUntilChanged()
            .drive(keywordSegmented.rx.selectedSegmentIndex)
            .disposed(by: disposeBag)
        
        keywordSegmented.rx.selectedSegmentIndex
            .distinctUntilChanged()
            .bind(to: viewModel.index)
            .disposed(by: disposeBag)
        
        keywordSegmented.rx.selectedSegmentIndex
            .subscribe(onNext: { [weak self] selectedIndex in
                guard let strongSelf = self else { return }
                strongSelf.setViewControllers([strongSelf.viewModel.articlesViewControllers[selectedIndex]], direction: .forward, animated: false, completion: nil)
            })
        .disposed(by: disposeBag)
    }

}

// MARK: UIPageViewControllerDataSource

extension KeywordArticlesViewController: UIPageViewControllerDataSource {
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let articlesViewControllers = viewModel.articlesViewControllers
        guard let viewControllerIndex = articlesViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return articlesViewControllers.last
        }
        
        guard articlesViewControllers.count > previousIndex else {
            return nil
        }
        return articlesViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let articlesViewControllers = viewModel.articlesViewControllers

        guard let viewControllerIndex = articlesViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let articlesViewControllersCount = articlesViewControllers.count
        
        guard articlesViewControllersCount != nextIndex else {
            return articlesViewControllers.first
        }
        
        guard articlesViewControllersCount > nextIndex else {
            return nil
        }
        return articlesViewControllers[nextIndex]
    }
    
}

// MARK: - UIPageViewControllerDelegate

extension KeywordArticlesViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if let firstViewController = viewControllers?.first,
            let index = viewModel.articlesViewControllers.firstIndex(of: firstViewController) {
            viewModel.index.accept(index)

        }
        
    }
}
