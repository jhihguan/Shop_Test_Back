//
//  TmdbAPI.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/10.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation
import PromiseKit

protocol TmdbAPI {
    func getList(page: Int) -> Promise<MovieRoot>
    func getDetail(id: Int) -> Promise<MovieDetail>
}

class TmdbAPIProvider: TmdbAPI {
    
    private let network: NetworkHandler<TmdbTarget>
    
    init(network: NetworkHandler<TmdbTarget> = .init()) {
        self.network = network
    }
    
    func getList(page: Int) -> Promise<MovieRoot> {
        return firstly {
            network.request(.discover(page: page))
        }.map { data -> MovieRoot in
            try JSONDecoder().decode(MovieRoot.self, from: data)
        }
    }
    
    func getDetail(id: Int) -> Promise<MovieDetail> {
        return firstly {
            network.request(.detail(id: id))
        }.map { data -> MovieDetail in
            try JSONDecoder().decode(MovieDetail.self, from: data)
        }
    }
    
    
}
