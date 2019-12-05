//
//  PostDetailsViewController.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import UIKit

final class PostDetailsViewController: UIViewController {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorEmailLabel: UILabel!
    @IBOutlet weak var authorNumberLabel: UILabel!
    @IBOutlet weak var numberOfCommentsInPostLabel: UILabel!

    var viewModel: PostDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAuthor()

        fetchComments()
    }

    func fetchAuthor() {
        viewModel.loadPostAuthor()
    }

    func fetchComments() {
        viewModel.loadPostCommentsNumber()
    }
}

extension PostDetailsViewController : PostDetailsViewDelegate {

    func displayAuthor(name: String, email: String, phone: String) {
        authorNameLabel.text = name
        authorEmailLabel.text = email
        authorNumberLabel.text = phone
    }

    func displayCommentsNumber(commentsCount: Int) {
        numberOfCommentsInPostLabel.text = "\(commentsCount)"
    }
}


