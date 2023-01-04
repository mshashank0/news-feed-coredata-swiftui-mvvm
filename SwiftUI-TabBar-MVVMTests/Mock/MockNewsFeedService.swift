//
//  MockNewsFeedService.swift
//  SwiftUI-TabBar-MVVMTests
//
//  Created by Shashank Mishra on 04/01/23.
//

import Foundation
@testable import SwiftUI_TabBar_MVVM

class MockNewsFeedService: NewsFeedServiceDelegate {
    
    func getNewsFeed(query: String, completion: @escaping (Result<NewsFeedModel, NetworkError>) -> Void) {
        guard let data = readLocalFile() else {
            completion(.failure(.NoData))
            return
        }
        do {
            let decodedData = try JSONDecoder().decode(NewsFeedModel.self, from: data)
            completion(.success(decodedData))
        } catch let error {
            debugPrint(error)
            completion(.failure(.DecodingError))
        }
    }
    
    //MARK: - Read local file
    private func readLocalFile() -> Data? {
        guard let fileurl = Bundle.main.url(forResource: "cricketFeed", withExtension: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileurl)
            return data
        } catch (let error) {
            print(error)
            return nil
        }
    }
}
