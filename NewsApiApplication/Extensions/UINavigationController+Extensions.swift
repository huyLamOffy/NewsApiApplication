//
//  UINavigationControllerExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/6/16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//
#if os(iOS) || os(tvOS)
    import UIKit
    
    
    // MARK: - Methods
    public extension UINavigationController {
        
        private var shouldPushOrPop: Bool {
            for vc in viewControllers where vc.isBeingDismissed || vc.isBeingPresented {
                return false
            }
            return true
        }
        
        /// SwifterSwift: Pop ViewController with completion handler.
        ///
        /// - Parameter completion: optional completion handler (default is nil).
        func popVC(animated: Bool = true, _ completion: (() -> Void)? = nil) {
            guard shouldPushOrPop else { return }
            // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            popViewController(animated: animated)
            CATransaction.commit()
        }
        
        /// SwifterSwift: Push ViewController with completion handler.
        ///
        /// - Parameters:
        ///   - viewController: viewController to push.
        ///   - completion: optional completion handler (default is nil).
        func pushVC(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil)  {
            guard shouldPushOrPop else { return }
            // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            pushViewController(viewController, animated: animated)
            CATransaction.commit()
        }
        
        /// SwifterSwift: Make navigation controller's navigation bar transparent.
        ///
        /// - Parameter tint: tint color (default is .white).
        func makeTransparent(withTint tint: UIColor = .white) {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
            navigationBar.tintColor = tint
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tint]
            view.backgroundColor = .clear
        }
        
    }
#endif
