//
//  MovieDetailViewController.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var spokenLanguagesLabel: UILabel!
    @IBOutlet weak var movieLanguageLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = viewModel.movieTitle()
        viewModel.loadDetail()
        viewModel.successAction = { [weak self] detail in
            if let backdrop = detail.backdropPath {
                self?.backdropImageView.kf.setImage(with: URL(string: backdrop.tmdbImagePath()))
            }
            self?.titleLabel.text = detail.title
            self?.synopsisLabel.text = detail.synopsis
            self?.genresLabel.text = detail.genres.map {
                $0.name
            }.joined(separator: ", ")
            self?.spokenLanguagesLabel.text = detail.spokenLanguagues.map {
                $0.name
            }.joined(separator: ", ")
            self?.movieLanguageLabel.text = detail.language
            if let duration = detail.duration {
                let hour = duration / 60
                self?.durationLabel.text = "\(hour) hrs \(duration - hour * 60) mins"
            } else {
                self?.durationLabel.text = "Not provided"
            }
        }
        viewModel.errorAction = { error in
            print(error)
        }
        viewModel.bookAction = { urlString in
            guard let url = URL(string: urlString) else {
                return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
