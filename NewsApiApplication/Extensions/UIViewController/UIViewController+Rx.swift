//
//  UIViewController+Rx.swift
//  Logistic
//
//  Created by OkieLa Dev on 3/10/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Collab Rx

extension Reactive where Base: BaseViewController {
    var progressStatus: Binder<ProgressStatus> {
        return Binder(self.base) { (vc, progressStatus) in
            switch progressStatus {
            case .complete:
                break
            default:
                vc.progressHUD?.hide(animated: false)
            }
            vc.show(progressStatus: progressStatus)
        }
    }
    
    var error: Binder<Error?> {
        return Binder(self.base) { vc, error in
            if let error = error {
                vc.show(error: error)
            }
        }
    }
}
