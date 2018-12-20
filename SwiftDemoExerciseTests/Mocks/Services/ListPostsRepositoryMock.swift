//
//  APIServiceMock.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

@testable import SwiftDemoExercise

class ListPostsRepositoryMock: ListPostsRepositoryProtocol {

    var isLoadDataBeingCalled = false

    func loadData(complete: @escaping ([Post]?) -> ()) {
        isLoadDataBeingCalled = true
    }
}
