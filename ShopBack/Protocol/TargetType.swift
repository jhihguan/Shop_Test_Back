//
//  TargetType.swift
//  ShopBack
//
//  Created by Wane Wang on 2019/2/10.
//  Copyright © 2019 Wane. All rights reserved.
//

import Foundation

protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [(header: String, value: String)]? { get }
    var type: ContentType { get }
}

enum RequestMethod: String {
    case get        = "GET"
    case put        = "PUT"
    case patch      = "PATCH"
    case post       = "POST"
    case delete     = "DELETE"
}

enum ContentType: String {
    case json       = "application/json"
    case form       = "application/x-www-form-urlencoded"
}

extension TargetType {
    
    var url: String {
        return baseURL.absoluteString + path
    }
    
    func buildRequest() throws -> URLRequest {
        var request: URLRequest
        let localParameters = parameters ?? [:]
        if method == .get {
            guard let url = url(string: url, from: localParameters) else {
                throw NetworkError.badUrl
            }
            request = URLRequest(url: url)
        } else {
            guard let u = URL(string: url) else {
                throw NetworkError.badUrl
            }
            request = URLRequest(url: u)
            request.httpBody = try JSONSerialization.data(withJSONObject: localParameters, options: .sortedKeys)
            request.setValue(type.rawValue, forHTTPHeaderField: "Content-Type")
        }
        request.httpMethod = self.method.rawValue
        headers?.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.header)
        }
        return request
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
}
