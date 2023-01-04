//
//  NewsFeedModel.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import Foundation

// MARK: - NewsFeedModel
struct NewsFeedModel: Codable {
    let hits: [Hit]
    let nbHits, page, nbPages, hitsPerPage: Int?
    let exhaustiveNbHits, exhaustiveTypo: Bool?
    let exhaustive: Exhaustive
    let query, params: String?
    let processingTimeMS: Int?
    let processingTimingsMS: ProcessingTimingsMS
    let serverTimeMS: Int?
}

// MARK: - Exhaustive
struct Exhaustive: Codable {
    let nbHits, typo: Bool
}

// MARK: - Hit
struct Hit: Codable, Identifiable {
    var id = UUID()
    let createdAt, title: String
    let url: String
    let author: String
    let points: Int
    let storyText, commentText: String?
    let numComments: Int
    let storyID, storyTitle, storyURL, parentID: String?
    let createdAtI: Int
    let tags: [String]
    let objectID: String
    let highlightResult: HighlightResult

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title, url, author, points
        case storyText = "story_text"
        case commentText = "comment_text"
        case numComments = "num_comments"
        case storyID = "story_id"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case parentID = "parent_id"
        case createdAtI = "created_at_i"
        case tags = "_tags"
        case objectID
        case highlightResult = "_highlightResult"
    }
}

// MARK: - HighlightResult
struct HighlightResult: Codable {
    let title, url, author: Author
}

// MARK: - Author
struct Author: Codable {
    let value: String?
    let matchLevel: String?
    let matchedWords: [String]
    let fullyHighlighted: Bool?
}

// MARK: - ProcessingTimingsMS
struct ProcessingTimingsMS: Codable {
    let fetch: Fetch
    let request: Request
    let total: Int?
}

// MARK: - Fetch
struct Fetch: Codable {
    let scanning, total: Int?
}

// MARK: - Request
struct Request: Codable {
    let roundTrip: Int?
}
