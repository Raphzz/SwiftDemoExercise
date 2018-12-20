//
//  Comments.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

struct Comment: Codable {

    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
