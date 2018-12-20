//
//  SwiftDemoExerciseTests.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import XCTest

@testable import SwiftDemoExercise

class SwiftDemoExerciseTests: XCTestCase {

    private var mockViewDelegate = ListPostsViewDelegateMock()

    private var mockRepository = ListPostsRepositoryMock()

    private var mockViewModel: ListPostsViewModel!

    private let mockPostResponse = PostsMockResponse()

    override func setUp() {
        mockViewModel = ListPostsViewModel(delegate: ListPostsViewDelegateMock(), service: ListPostsRepositoryMock())
    }

    override func tearDown() {
        mockViewModel = nil
    }

    func testInit_AssertViewModelMockIsNotNil() {
        XCTAssertNotNil(mockViewModel)
    }

    func testInit_AssertServiceMockIsNotNil() {
        XCTAssertNotNil(mockRepository)
    }

    func testInit_AssertServiceMockFuncIsBeingCalled() {
        mockRepository.loadData(complete: {(_: [Post]?) in })
        XCTAssert(mockRepository.isLoadDataBeingCalled)
    }

    func testInit_AssertViewControllerMockLoadDataIsBeingCalled() {
        mockViewDelegate.displayData()
        XCTAssert(mockViewDelegate.isDisplayDataBeingCalled)
    }

    func testInit_AssertViewControllerMockStartLoadingIsBeingCalled() {
        mockViewDelegate.startLoading()
        XCTAssert(mockViewDelegate.isStartLoadingBeingCalled)
    }

    func testInit_AssertViewControllerMockStopLoadingIsBeingCalled() {
        mockViewDelegate.stopLoading()
        XCTAssert(mockViewDelegate.isStopLoadingBeingCalled)
    }

    func testInit_AssertViewControllerMockShowErrorIsBeingCalled() {
        mockViewDelegate.showError("Test")
        XCTAssert(mockViewDelegate.isShowErrorBeingCalled)
    }

    func testInit_AssertPostResponseIsNotNil() {
        XCTAssertNotNil(mockPostResponse.getResponse())
    }

    func testInit_AssertSetPosts() {
        XCTAssertNotNil(mockPostResponse.getResponse())

        mockViewModel.setPosts(mockPostResponse.getResponse()!)

        XCTAssertEqual(mockPostResponse.getResponse()?.count, mockViewModel.getPostsCount())
    }

    func testInit_AssertGetPostByIndex() {
        XCTAssertNotNil(mockPostResponse.getResponse())

        mockViewModel.setPosts(mockPostResponse.getResponse()!)

        XCTAssertNotNil(mockViewModel.getPostForIndex(0))

        //On mock json, first post has ID 1
        XCTAssertEqual(mockViewModel.getPostForIndex(0).id, 1)
    }
}
