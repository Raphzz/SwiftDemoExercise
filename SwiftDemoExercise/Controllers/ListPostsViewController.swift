//
//  ListPostsViewController.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import UIKit

final class ListPostsViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var tableView: UITableView!

    private var viewModel: ListPostsViewModel!

    private let refreshControl = UIRefreshControl()

    private let rowReusableId = String(describing: PostTableViewCell.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ListPostsViewModel(delegate: self)

        setupTableView()

        loadPosts()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: rowReusableId, bundle: nil), forCellReuseIdentifier: rowReusableId)

        refreshControl.addTarget(self, action: #selector(loadPosts), for: UIControl.Event.valueChanged)

        tableView.addSubview(refreshControl)
    }

    @objc func loadPosts() {
        viewModel.loadPosts()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showPostDetails" {

            guard let destinationVC = segue.destination as? PostDetailsViewController,
                let index = sender as? Int else {
                return
            }

            let post = viewModel.getPostForIndex(index)
            destinationVC.viewModel = PostDetailsViewModel(delegate: destinationVC, post: post)
        }
    }
}

extension ListPostsViewController: ListPostsViewDelegate {

    func displayData() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }

    func startLoading() {
        tableView.isHidden = true
        loadingView.isHidden = false
    }

    func stopLoading() {
        tableView.isHidden = false
        loadingView.isHidden = true
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
            self.loadPosts()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ListPostsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPostDetails", sender: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ListPostsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPostsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: rowReusableId) as? PostTableViewCell else {
            fatalError("Couldn't dequeue UserTableViewCell")
        }

        cell.selectionStyle = .none

        let post = viewModel.getPostForIndex(indexPath.row)

        cell.fillData(title: post.title, body: post.body)

        return cell
    }
}
