//
//  UIViewController+Extensions.swift
//  lienphatratios
//
//  Created by OkieLa Dev on 10/16/19.
//  Copyright © 2019 medihub. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentVC(_ vc: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(vc, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true) {
        dismiss(animated: animated, completion: nil)
    }
    
    var previousViewController: UIViewController?{
        if let controllersOnNavStack = navigationController?.viewControllers {
            let n = controllersOnNavStack.count
            //if self is still on Navigation stack
            if controllersOnNavStack.last === self, n > 1{
                return controllersOnNavStack[n - 2]
            } else if n > 0{
                return controllersOnNavStack[n - 1]
            }
            return nil
        } else {
            return presentingViewController
        }
    }
    
    public var isVisible: Bool {
        // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
        return self.isViewLoaded && view.window != nil
    }
    
    func showAlert(title: String?, message: String?, alertActions: [UIAlertAction] = [], cancelAction: ((UIAlertAction) -> ())? = nil) {
        if presentedViewController is UIAlertController {
            dismiss(animated: false)
        }
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "Đóng", style: .cancel, handler: cancelAction)
        alertController.addAction(OKAction)
        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func show(error: Error, alertActions: [UIAlertAction] = [], cancelAction: ((UIAlertAction) -> ())? = nil) {
        showErrorAlert(message: error.message, alertActions: alertActions, cancelAction: cancelAction)
    }
    
    func showErrorAlert(message: String?, alertActions: [UIAlertAction] = [], cancelAction: ((UIAlertAction) -> ())? = nil) {
        showAlert(title: "Lỗi", message: message, alertActions: alertActions, cancelAction: cancelAction)
    }
    
    /// returns true only if the viewcontroller is presented.
    func isModal() -> Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            if let parent = parent, !(parent is UINavigationController || parent is UITabBarController) {
                return false
            }
            return true
        } else if let navController = navigationController, navController.presentingViewController?.presentedViewController == navController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
        
    }
    
    func push(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.pushVC(viewController, animated: animated, completion: completion)
    }
    
    func changeRootViewControllerWithAnimation(rootViewController: UIViewController) {
        let rootVC = rootViewController
        let snapshot = (UIApplication.shared.windows.first?.snapshotView(afterScreenUpdates: true))!
        rootVC.view.addSubview(snapshot)
        
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIView.transition(with: snapshot,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
                            snapshot.layer.opacity = 0.15
                            snapshot.transform = CGAffineTransform(scaleX: 1.11, y: 1.11)
        },
                          completion: { status in
                            snapshot.layer.opacity = 0
                            snapshot.removeFromSuperview()
        })
    }
}

extension UIViewController {
    class func instance() -> Self {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.initialViewController()
    }
    
}
