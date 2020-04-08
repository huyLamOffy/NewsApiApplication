//
//  ArticleCell.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var article: Article? {
        didSet {
            updateUI()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView.image = nil
        titleLabel.text = nil
        contentLabel.text = nil
    }
    
    func updateUI() {
        articleImageView.kfDownloaded(fromUrl: article?.urlToImage, shouldResize: true)
        titleLabel.text = article?.title
        contentLabel.text = article?.content
    }
}
