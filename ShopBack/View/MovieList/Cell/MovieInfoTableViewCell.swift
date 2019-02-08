//
//  MovieInfoTableViewCell.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/8.
//  Copyright © 2019 Wane. All rights reserved.
//

import UIKit
import Kingfisher

class MovieInfoTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ info: MovieInfo) {
        if let poster = info.posterPath {
            posterImageView.kf.setImage(with: URL(string: poster.tmdbImage()))
        } else if let backdrop = info.backdropPath {
            posterImageView.kf.setImage(with: URL(string: backdrop.tmdbImage()))
        } else {
            posterImageView.image = nil
        }
        titleLabel.text = info.title
        popularityLabel.text = "\(info.popularity)"
    }
    
}
