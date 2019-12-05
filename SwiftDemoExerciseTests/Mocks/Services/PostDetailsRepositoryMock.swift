//
//  PostDetailsServiceMock.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

@testable import SwiftDemoExercise

class PostDetailsRepositoryMock: PostDetailsRepositoryProtocol {

    var isLoadAuthorBeingCalled = false
    var isLoadCommentsBeingCalled = false

    func loadAuthor(postId: Int, complete: @escaping (User?) -> ()) {
        isLoadAuthorBeingCalled = true
    }

    func loadComments(postId: Int, complete: @escaping ([Comment]?) -> ()) {
        isLoadCommentsBeingCalled = true
    }
}
