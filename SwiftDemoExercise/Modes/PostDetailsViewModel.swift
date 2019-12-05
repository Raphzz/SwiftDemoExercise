//
//  PostDetailsViewModel.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import Foundation

protocol PostDetailsViewDelegate: class {
    func displayAuthor(name: String, email: String, phone: String)
    func displayCommentsNumber(commentsCount: Int)
}

final class PostDetailsViewModel {

    private var postSelected: Post

    private var service: PostDetailsRepositoryProtocol

    weak var delegate: PostDetailsViewDelegate?

    init(delegate: PostDetailsViewDelegate, post: Post, service: PostDetailsRepositoryProtocol = PostDetailsRepository()) {
        self.delegate = delegate
        self.postSelected = post
        self.service = service
    }

    func getSelectedPost() -> Post {
        return postSelected
    }

    func loadPostAuthor() {
        service.loadAuthor(postId: postSelected.id, complete: { user in
            DispatchQueue.main.async {
                guard let user = user else {
                    self.delegate?.displayAuthor(name: "No user found", email: "", phone: "")
                    return
                }

                self.delegate?.displayAuthor(name: user.name, email: user.email, phone: user.phone)
            }
        })
    }

    func loadPostCommentsNumber() {
        service.loadComments(postId: postSelected.id, complete: { comments in
            DispatchQueue.main.async {
                guard let comments = comments else {
                    return
                }

                self.delegate?.displayCommentsNumber(commentsCount: comments.count)
            }
        })
    }
}
