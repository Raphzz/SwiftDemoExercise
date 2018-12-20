//
//  PostDetailsViewDelegateMock.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

@testable import SwiftDemoExercise

class PostDetailsViewDelegateMock: PostDetailsViewDelegate {

    var isDisplayAuthorBeingCalled = false
    var isDisplayCommentsNumberBeingCalled = false

    func displayAuthor(name: String, email: String, phone: String) {
        isDisplayAuthorBeingCalled = true
    }

    func displayCommentsNumber(commentsCount: Int) {
        isDisplayCommentsNumberBeingCalled = true
    }
}
