//
//  AppDelegate.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/8/20.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ReachabilityManager.shared.startMonitoring()
        AppearanceUIHelper.customizeAppearance()

        let vc = KeywordArticlesViewController.instance()
//        let requestModel = PagingRequestModel<TopHeadlineNewsRequestModel>(requestModel: TopHeadlineNewsRequestModel())
//        vc.viewModel.request = .getTopHeadline(requestModel: requestModel)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        return true
    
    }
}

