//
//  PostsMockResponse.swift
//  SwiftDemoExerciseTests
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

@testable import SwiftDemoExercise

class PostsMockResponse {

    private var posts: [Post]?

    init() {
        let bundle = Bundle(for: SwiftDemoExerciseTests.self)

        if let path = bundle.url(forResource: "PostResponseMock", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let response = try JSONDecoder().decode([Post].self, from: data)
                self.posts = response
            } catch {}
        }
    }

    func getResponse() -> [Post]? {
        return posts
    }
}
