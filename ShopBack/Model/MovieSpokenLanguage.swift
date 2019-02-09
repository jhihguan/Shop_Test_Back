//
//  MovieSpokenLanguage.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation

/*
 "iso_639_1": "en",
 "name": "English"
 */

struct MovieSpokenLanguage: Codable {
    let iso6391: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case name
    }
}
