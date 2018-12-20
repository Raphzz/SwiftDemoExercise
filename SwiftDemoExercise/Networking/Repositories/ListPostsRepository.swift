//
//  ListPostsService.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

protocol ListPostsRepositoryProtocol: class {
    func loadData(complete: @escaping ([Post]?) -> ())
}

final class ListPostsRepository: ListPostsRepositoryProtocol {

    private let cache = CacheHandler()

    func loadData(complete: @escaping ([Post]?) -> ()) {

        RestAPI().apiRequest(endPoint: "posts") { data in
            if let responseData = data {
                do {
                    let response = try JSONDecoder().decode([Post].self, from: responseData)

                    self.cache.save(response)

                    complete(response)
                } catch {
                    complete(self.getCachedPosts())
                }
            } else {
                complete(self.getCachedPosts())
            }
        }
    }
}

extension ListPostsRepository {
    func getCachedPosts() -> [Post]? {
        return self.cache.get([Post]())
    }
}
