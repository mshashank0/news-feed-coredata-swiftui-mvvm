//
//  APIRouter.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    case getNewsFeed(String)
    
    private var urlPath: String {
        switch self {
        case .getNewsFeed(let query):
            return "http://hn.algolia.com/api/v1/search?query=\(query)"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getNewsFeed(_):
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

