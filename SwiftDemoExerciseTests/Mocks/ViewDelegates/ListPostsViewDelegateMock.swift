//
//  ListPostsViewDelegateMock.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

@testable import SwiftDemoExercise

class ListPostsViewDelegateMock: ListPostsViewDelegate {

    var isDisplayDataBeingCalled = false
    var isStartLoadingBeingCalled = false
    var isStopLoadingBeingCalled = false
    var isShowErrorBeingCalled = false

    var errorMessage: String?

    func stopLoading() {
        isStopLoadingBeingCalled = true
    }

    func startLoading() {
        isStartLoadingBeingCalled = true
    }

    func showError(_ message: String) {
        isShowErrorBeingCalled = true
        errorMessage = message
    }

    func displayData() {
        isDisplayDataBeingCalled = true
    }
}
