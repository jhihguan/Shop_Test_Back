//
//  MovieRoot.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation
/*
 "page": 1,
 "total_results": 401607,
 "total_pages": 20081,
 "results":
 */
struct MovieRoot: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [MovieInfo]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
