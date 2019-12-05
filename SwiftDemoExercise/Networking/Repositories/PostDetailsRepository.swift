//
//  PostDetailsService.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

protocol PostDetailsRepositoryProtocol: class {
    func loadAuthor(postId: Int, complete: @escaping (User?) -> ())
    func loadComments(postId: Int, complete: @escaping ([Comment]?) -> ())
}

final class PostDetailsRepository : PostDetailsRepositoryProtocol {

    private let cache = CacheManager()

    func loadAuthor(postId: Int, complete: @escaping (User?) -> ())  {

        let cacheAccessKey = "user_post\(postId)"

        RestAPI().apiRequest(endPoint: "users/\(postId)") { data in
            if let responseData = data {
                do {
                    let response = try JSONDecoder().decode(User.self, from: responseData)

                    self.cache.save(response, key: "user_post\(postId)")

                    complete(response)
                } catch {
                    complete(self.getCachedUser(key: cacheAccessKey))
                }
            } else {
                complete(self.getCachedUser(key: cacheAccessKey))
            }
        }
    }

    func loadComments(postId: Int, complete: @escaping ([Comment]?) -> ()) {

        let cacheAccessKey = "comments_post\(postId)"

        RestAPI().apiRequest(endPoint: "posts/\(postId)/comments") { data in
            if let responseData = data {
                do {
                    let response = try JSONDecoder().decode([Comment].self, from: responseData)

                    self.cache.save(response, key: cacheAccessKey)

                    complete(response)
                } catch {
                    complete(self.getCachedComments(key: cacheAccessKey))
                }
            } else {
                complete(self.getCachedComments(key: cacheAccessKey))
            }
        }
    }
}

extension PostDetailsRepository {
    func getCachedComments(key: String) -> [Comment]? {
        return self.cache.get([Comment](), key: key)
    }

    func getCachedUser(key: String) -> User? {
        return self.cache.get(User.self, key: key)
    }
}
