//
//  Comments.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

struct Comment: Codable {

    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
