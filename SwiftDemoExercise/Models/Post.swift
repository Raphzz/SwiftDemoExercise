//
//  Post.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

struct Post: Codable {

    let userId: Int
    let id: Int
    let title: String
    let body: String
}
