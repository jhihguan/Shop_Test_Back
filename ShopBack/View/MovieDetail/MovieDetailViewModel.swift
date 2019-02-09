//
//  MovieDetailViewModel.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation
import PromiseKit

protocol MovieDetailViewModelProtocol {
    var successAction: ((MovieDetail) -> Void)? { get set }
    var errorAction: ((Error) -> Void)? { get set }
    var bookAction: ((String) -> Void)? { get set }
    func loadDetail()
    func movieTitle() -> String
    func showBook()
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    var successAction: ((MovieDetail) -> Void)?
    var errorAction: ((Error) -> Void)?
    var bookAction: ((String) -> Void)?
    
    private let info: MovieInfo
    private let network: NetworkHandler
    
    init(_ info: MovieInfo, network: NetworkHandler) {
        self.network = network
        self.info = info
    }
    
    func loadDetail() {
        firstly {
        self.network.get("https://api.themoviedb.org/3/movie/\(info.id)", parameters: [:])
        }.map { data -> MovieDetail in
            try JSONDecoder().decode(MovieDetail.self, from: data)
        }.done { [weak self] detail in
            self?.successAction?(detail)
        }.catch { error in
            self.errorAction?(error)
        }
    }
    
    func movieTitle() -> String {
        return info.title
    }
    
    func showBook() {
        self.bookAction?("https://www.cathaycineplexes.com.sg/")
    }
}
