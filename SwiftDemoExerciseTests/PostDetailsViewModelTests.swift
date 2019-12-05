//
//  PostDetailsTests.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import XCTest

@testable import SwiftDemoExercise

class PostDetailsViewModelTests: XCTestCase {

    private let mockViewDelegate = PostDetailsViewDelegateMock()

    private let mockPostsResponse = PostsMockResponse()

    private var mockViewModel: PostDetailsViewModel!

    private var mockRepository = PostDetailsRepository()

    override func setUp() {
        mockViewModel = PostDetailsViewModel(delegate: mockViewDelegate, post: mockPostsResponse.getResponse()!.first!)
    }

    func testInit_AssertViewModelsNotNil() {
        XCTAssertNotNil(mockViewModel)
    }

    func testInit_AssertViewModelsPostSelectedNotNil() {
        XCTAssertNotNil(mockViewModel.getSelectedPost())
        XCTAssert(mockViewModel.getSelectedPost().body == mockPostsResponse.getResponse()!.first!.body)
    }

    func testInit_AssertRepositoryGetAuthorIsNotNil() {
        let expectation = XCTestExpectation(description: "Download users")

        mockRepository.loadAuthor(postId: 1, complete: { user in
            XCTAssertNotNil(user)

            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 10.0)
    }

    func testInit_AssertRepositoryGetCommentsIsNotNil() {
        let expectation = XCTestExpectation(description: "Download comments")

        mockRepository.loadComments(postId: 1, complete: { comments in
            XCTAssertNotNil(comments)

            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 10.0)
    }

    func testInit_AssertDelegateDisplayAuthorIsBeingCalled() {
        mockViewDelegate.displayAuthor(name: "", email: "", phone: "")
        XCTAssert(mockViewDelegate.isDisplayAuthorBeingCalled)
    }

    func testInit_AssertDelegateDisplayCommentsIsBeingCalled() {
        mockViewDelegate.displayCommentsNumber(commentsCount: 5)
        XCTAssert(mockViewDelegate.isDisplayCommentsNumberBeingCalled)
    }
}
