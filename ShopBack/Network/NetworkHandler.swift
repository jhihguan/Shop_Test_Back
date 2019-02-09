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
    
    private func url(string: String, from parameters: [String: Any]) -> URL? {
        var urlComponent = URLComponents(string: string)
        var queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        queryItems.append(URLQueryItem(name: "api_key", value: "a979f3b40602812876c025b41afba43c"))
        urlComponent?.queryItems = queryItems
        return urlComponent?.url
    }
    
    func get(_ urlString: String, parameters: [String: Any] = [:]) -> Promise<Data> {
        guard let url = url(string: urlString, from: parameters) else {
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
