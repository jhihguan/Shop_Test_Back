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
    func reloadAll()
    func loadNextPage()
    func isLoadNextPageIndex(_ index: Int) -> Bool
    func numberOfDatas() -> Int
    func data(at index: Int) -> MovieInfo
}

class MovieListViewModel: MovieListViewModelProtocol {
    
    var reloadAction: (() -> Void)?
    var errorAction: ((Error) -> Void)?
    private var nextPage: Int = 1
    private var network: NetworkHandler
    private var movies: [MovieInfo]
    private var isLoading: Bool = false
    init(network: NetworkHandler = .init()) {
        movies = []
        self.network = network
    }
    
    func loadNextPage() {
        guard !isLoading else {
            return
        }
        self.isLoading = true
        firstly {
            self.network.get("https://api.themoviedb.org/3/discover/movie", parameters: ["sort_by": "release_date.desc", "page": nextPage])
        }.map { data -> MovieRoot in
            try JSONDecoder().decode(MovieRoot.self, from: data)
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
    
    func isLoadNextPageIndex(_ index: Int) -> Bool {
        return index == movies.count - 2
    }
    
    func numberOfDatas() -> Int {
        return movies.count
    }
    
    func data(at index: Int) -> MovieInfo {
        return movies[index]
    }
    
}
