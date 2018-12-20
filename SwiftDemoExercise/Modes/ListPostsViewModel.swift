//
//  ListPostsViewModel.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 16/12/2018.
//  Copyright © 2018 raph. All rights reserved.
//

import Foundation

protocol ViewDelegate: class {
    func showError(_ message: String)
    func startLoading()
    func stopLoading()
}

protocol ListPostsViewDelegate: ViewDelegate {
    func displayData()
}

final class ListPostsViewModel {

    private var count: Int {
        return posts.count
    }

    private var service: ListPostsRepositoryProtocol

    private var posts: [Post] = []

    weak var delegate: ListPostsViewDelegate?

    init(delegate: ListPostsViewDelegate, service: ListPostsRepositoryProtocol = ListPostsRepository()) {
        self.service = service
        self.delegate = delegate
    }

    func loadPosts() {

        delegate?.startLoading()

        service.loadData(complete: { (result: [Post]?) in

            DispatchQueue.main.async {
                guard let posts = result else {
                    self.delegate?.stopLoading()
                    self.delegate?.showError("Error while trying to reach the server.")
                    return
                }

                self.setPosts(posts)

                self.delegate?.stopLoading()
                self.delegate?.displayData()
            }
        })
    }

    func setPosts(_ posts: [Post]) {
        self.posts = posts
    }

    func getPostsCount() -> Int {
        return count
    }

    func getPostForIndex(_ index: Int) -> Post {
        return posts[index]
    }
}
