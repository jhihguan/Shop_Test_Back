//
//  MovieListViewModel.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/8.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation

protocol MovieListViewModelProtocol {
    func numberOfDatas() -> Int
    func data(at index: Int) -> String
}

class MovieListViewModel: MovieListViewModelProtocol {
    
    init() {
        
    }
    
    func numberOfDatas() -> Int {
        return 2
    }
    
    func data(at index: Int) -> String {
        return "a"
    }
    
}
