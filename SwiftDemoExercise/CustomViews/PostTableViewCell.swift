//
//  PostTableViewCell.swift
//  SwiftDemoExercise
//
//  Created by Raphael Pedrini Velasqua on 05/12/2019.
//  Copyright © 2019 raph. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postBody: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillData(title: String, body: String) {
        postTitle.text = title
        postBody.text = body
    }
}
