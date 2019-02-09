//
//  MovieListViewModel.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/8.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation
import PromiseKit

protocol MovieListViewModelProtocol {
    var reloadAction: (() -> Void)? { get set }
    var errorAction: ((Error) -> Void)? { get set }
    var selectAction: ((MovieDetailViewModelProtocol) -> Void)? { get set }
    func reloadAll()
    func loadNextPage()
    func shouldLoadNextPageIndex(_ index: Int) -> Bool
    func numberOfMovies() -> Int
    func data(at index: Int) -> MovieInfo
    func select(at index: Int)
}

class MovieListViewModel: MovieListViewModelProtocol {
    
    var reloadAction: (() -> Void)?
    var errorAction: ((Error) -> Void)?
    var selectAction: ((MovieDetailViewModelProtocol) -> Void)?
    private var nextPage: Int = 1
    private let apiProvider: TmdbAPI
    private var movies: [MovieInfo]
    private var isLoading: Bool = false
    init(api: TmdbAPI) {
        movies = []
        self.apiProvider = api
    }
    
    func loadNextPage() {
        guard !isLoading else {
            return
        }
        self.isLoading = true
        firstly {
            apiProvider.getList(page: nextPage)
        }.done { [weak self] root in
            self?.movies.append(contentsOf: root.results)
            self?.nextPage = root.page + 1
        }.ensure {
            self.reloadAction?()
            self.isLoading = false
        }.catch { error in
            self.errorAction?(error)
        }
        
    }
    
    func reloadAll() {
        movies = []
        nextPage = 1
        loadNextPage()
    }
    
    func shouldLoadNextPageIndex(_ index: Int) -> Bool {
        return index == movies.count - 2
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func data(at index: Int) -> MovieInfo {
        return movies[index]
    }
    
    func select(at index: Int) {
        selectAction?(MovieDetailViewModel(movies[index], api: apiProvider))
    }
    
}
