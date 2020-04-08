//
//  BaseViewController.swift
//  Logistic
//
//  Created by OkieLa Dev on 2/21/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = [.bottom]
        dataBinding()
        configureUI()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layoutUI()
    }

    //MARK: - UI methods
    
    /// Run in viewDidLoad function
    internal func configureUI() {

        // prevent display large title on iOS 11.0 devices
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationItem.largeTitleDisplayMode = .never
        }
       
    }
    
    /// Trigger when viewDidLayoutSubviews called
    internal func layoutUI() {
        
    }
    
    //MARK: - HELPER METHODS
    
    /// Run in viewDidLoad function
    internal func dataBinding() {
        
    }
    
    
    func show(progressStatus: ProgressStatus) {
        switch progressStatus {
        case .failed(let message):
            progressHUD = progressHudShowError(message: message)
        case .success(let message):
            progressHUD = progressHudShowDone(message: message)
        case .loading(let message):
            progressHUD = progressHudShowLoading(withMessage: message)
        case .complete:
            self.dismissHud()
        }
    }
    
    
    //MARK: - DEINIT
    
    deinit {
        print("\(self) deinit")
    }
}
