//
//  NewsFeedViewModelTests.swift
//  SwiftUI-NewsFeedViewModelTests-MVVMTests
//
//  Created by Shashank Mishra on 04/01/23.
//

import XCTest
@testable import SwiftUI_TabBar_MVVM

class NewsFeedViewModelTests: XCTestCase {

    func testNewsFeed_200ok() {
        let sut = NewsFeedViewModel(newsFeedService: MockNewsFeedService())
        sut.getNewsFeed()
        XCTAssertNotNil(sut.newsFeed)
        XCTAssert(sut.newsFeed?.hits.count == 5)
    }

}
