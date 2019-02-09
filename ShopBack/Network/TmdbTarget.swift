//
//  TmdbTarget.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/10.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation

enum TmdbTarget {
    case discover(page: Int)
    case detail(id: Int)
}

extension TmdbTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3") else {
            fatalError("error api base url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .discover:
            return "/discover/movie"
        case .detail(let id):
            return "/movie/\(id)"
        }
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .discover(let page):
            return ["primary_release_date.lte": "2019-02-09", "sort_by": "release_date.desc", "page": page]
        case .detail:
            return nil
        }
    }
    
    var headers: [(header: String, value: String)]? {
        return nil
    }
    
    var type: ContentType {
        return .json
    }
    
    
}
