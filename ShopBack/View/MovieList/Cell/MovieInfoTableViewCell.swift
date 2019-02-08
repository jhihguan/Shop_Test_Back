//
//  MovieInfoTableViewCell.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/8.
//  Copyright © 2019 Wane. All rights reserved.
//

import UIKit

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
    
    func config() {
        
    }
    
}
