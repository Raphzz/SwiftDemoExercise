//
//  CacheHelperTests.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import XCTest

@testable import SwiftDemoExercise

class CacheHelperTests: XCTestCase {

    private let cacheHelper = CacheManager()

    private let mockPostsResponse = PostsMockResponse()

    func testInit_AssertObjectIsBeingSavedToCache() {

        cacheHelper.save(mockPostsResponse.getResponse()?.first, key: String(describing: mockPostsResponse.getResponse()?.first?.id))

        let cachedData = cacheHelper.get(Post.self, key: String(describing: mockPostsResponse.getResponse()?.first?.id))

        XCTAssertNotNil(cachedData!)
        XCTAssert(cachedData!.body == mockPostsResponse.getResponse()?.first?.body)
    }

    func testInit_AssertArrayIsBeingSavedToCache() {

        cacheHelper.save(mockPostsResponse.getResponse())

        let cachedData = cacheHelper.get([Post]())

        XCTAssertNotNil(cachedData!)
        XCTAssert(cachedData!.first?.body == mockPostsResponse.getResponse()?.first?.body)
    }
}
