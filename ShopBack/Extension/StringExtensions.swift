//
//  StringExtensions.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation

extension String {
    
    func tmdbImagePath() -> String {
        return "https://image.tmdb.org/t/p/w500\(self)"
    }
    
}
