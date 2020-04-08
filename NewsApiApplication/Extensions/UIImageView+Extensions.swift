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
                      completionHandler: CompletionHandler? = nil) {
        contentMode = mode
        
        guard let url = URL(string: link ?? "") else {
                image = placeholderImage
                return
        }
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
