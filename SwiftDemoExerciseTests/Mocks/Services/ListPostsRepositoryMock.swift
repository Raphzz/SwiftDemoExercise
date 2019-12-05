//
//  APIServiceMock.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

@testable import SwiftDemoExercise

class ListPostsRepositoryMock: ListPostsRepositoryProtocol {

    var isLoadDataBeingCalled = false

    func loadData(complete: @escaping ([Post]?) -> ()) {
        isLoadDataBeingCalled = true
    }
}
