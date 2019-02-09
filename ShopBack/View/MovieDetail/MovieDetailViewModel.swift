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
    private let apiProvider: TmdbAPI
    
    init(_ info: MovieInfo, api: TmdbAPI) {
        self.apiProvider = api
        self.info = info
    }
    
    func loadDetail() {
        firstly {
            apiProvider.getDetail(id: info.id)
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
