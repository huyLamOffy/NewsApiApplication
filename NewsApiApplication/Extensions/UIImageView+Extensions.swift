//
//  UIImageView+Extensions.swift
//  Logistic
//
//  Created by OkieLa Dev on 3/18/20.
//  Copyright © 2020 okiela. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func kfDownloaded(fromLink link: String?,
                      contentMode mode: UIView.ContentMode = .scaleAspectFit,
                      placeholderImage: UIImage? = UIImage(named: "img_placeholder"),
                      shouldResize: Bool = false,
                      completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        
        guard let url = URL(string: link ?? "") else {
                image = placeholderImage
                return
        }
        kfDownloaded(fromUrl: url,
                     contentMode: mode,
                     placeholderImage: placeholderImage,
                     shouldResize: shouldResize,
                     completionHandler: completionHandler)
    }
    
    func kfDownloaded(fromUrl url: URL?,
                      contentMode mode: UIView.ContentMode = .scaleAspectFit,
                      placeholderImage: UIImage? = UIImage(named: "img_placeholder"),
                      shouldResize: Bool = false,
                      completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        contentMode = mode
        let scale = UIScreen.main.scale
        var options: KingfisherOptionsInfo = [
            .scaleFactor(scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ]
        if shouldResize {
            let size = CGSize(width: bounds.width * scale, height: bounds.height * scale)
            options.append(.processor(ResizingImageProcessor(referenceSize: size)))
        }
        kf.indicatorType = .activity
        kf.setImage(
            with: url,
            placeholder: placeholderImage,
            options: options,
            completionHandler: completionHandler)
    }
}
