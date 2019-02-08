//
//  MovieInfo.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation
/*
 "vote_count": 1182,
 "id": 450465,
 "video": false,
 "vote_average": 6.8,
 "title": "Glass",
 "popularity": 310.841,
 "poster_path": "/svIDTNUoajS8dLEo7EosxvyAsgJ.jpg",
 "original_language": "en",
 "original_title": "Glass",
 "genre_ids": [
 53,
 9648,
 18
 ],
 "backdrop_path": "/lvjscO8wmpEbIfOEZi92Je8Ktlg.jpg",
 "adult": false,
 "overview": "In a series of escalating encounters, security guard David Dunn uses his supernatural abilities to track Kevin Wendell Crumb, a disturbed man who has twenty-four personalities. Meanwhile, the shadowy presence of Elijah Price emerges as an orchestrator who holds secrets critical to both men.",
 "release_date": "2019-01-16"
 */
struct MovieInfo: Codable {
    let popularity: Double
    let id: Int
    let posterPath: String?
    let backdropPath: String?
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case id
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case title
    }
    
}
