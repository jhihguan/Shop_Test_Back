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

class NetworkHandler {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get(_ urlString: String) -> Promise<Data> {
        guard let url = URL(string: urlString) else {
            return Promise.init(error: NetworkError.badUrl)
        }
        
        return firstly {
            session.dataTask(.promise, with: url).validate()
            }.compactMap {
                if $0.data.isEmpty {
                    return nil
                } else {
                    return $0.data
                }
            }
    }
    
}
