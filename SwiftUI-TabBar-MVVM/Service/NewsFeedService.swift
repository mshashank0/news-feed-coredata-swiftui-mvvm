//
//  NewsFeedService.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import Foundation

protocol NewsFeedServiceDelegate {
    func getNewsFeed(query: String, completion: @escaping(Result<NewsFeedModel, NetworkError>) -> Void)
}

class NewsFeedService: NewsFeedServiceDelegate {
    func getNewsFeed(query: String, completion: @escaping (Result<NewsFeedModel, NetworkError>) -> Void) {
        RestAPIClient.getNewFeed(query: query, completion: completion)
    }
}
