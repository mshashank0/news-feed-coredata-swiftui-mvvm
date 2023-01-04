//
//  NewsFeedViewModel.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import Foundation

class NewsFeedViewModel: ObservableObject {
    @Published var newsFeed: NewsFeedModel? //source of truth
    
    private let newsFeedService: NewsFeedServiceDelegate
    
    init(newsFeedService: NewsFeedServiceDelegate = NewsFeedService()) {
        self.newsFeedService = newsFeedService
    }
    
    func getNewsFeed() {
        newsFeedService.getNewsFeed(query: "hockey") { result in
            switch result {
            case .success(let feed):
                self.newsFeed = feed
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
