//
//  RestAPI.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

struct RestAPI {

    private static let apiUrl = "https://jsonplaceholder.typicode.com/%@"

    func apiRequest(endPoint: String, complete: @escaping (Data?)->()) {

        let url = URL(string: String(format: RestAPI.apiUrl, endPoint))!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                complete(nil)
                return
            }

            complete(data)
        }

        task.resume()
    }
}
