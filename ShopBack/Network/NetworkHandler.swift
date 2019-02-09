//
//  NetworkHandler.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/9.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation
import PromiseKit
import PMKFoundation

enum NetworkError: Error {
    case badUrl
}

class NetworkHandler<Target: TargetType> {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(_ target: Target) -> Promise<Data> {
        return firstly {
            session.dataTask(.promise, with: try target.buildRequest()).validate()
            }.compactMap {
                if $0.data.isEmpty {
                    return nil
                } else {
                    return $0.data
                }
        }
    }
    
}
