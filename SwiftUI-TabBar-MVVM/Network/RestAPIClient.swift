//
//  RestAPIClient.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case BadURL
    case NoData
    case DecodingError
    case APIError(String)
}

class RestAPIClient {
   
    static func request<T: Decodable>(type: T.Type, route: APIRouter,
                           completion: @escaping(Result<T, NetworkError>)-> Void) {
        AF.request(route).response { response in
            let result = response.result
            switch result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.NoData))
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.DecodingError))
                }
                
            case .failure(let error):
                completion(.failure(.APIError(error.localizedDescription)))
            }
        }
    }
    
    //MARK: - API call for getting News feed
    static func getNewFeed(query: String, completion: @escaping(Result<NewsFeedModel, NetworkError>) -> Void) {
        return request(type: NewsFeedModel.self, route: .getNewsFeed(query), completion: completion)
    }
}
