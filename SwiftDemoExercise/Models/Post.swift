//
//  Post.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

struct Post: Codable {

    let userId: Int
    let id: Int
    let title: String
    let body: String
}
