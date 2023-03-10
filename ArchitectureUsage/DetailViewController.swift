//
//  DetailViewController.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var label: UILabel!

    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

    @IBAction func tappBackButton(_ sender: UIButton) {
        presenter.tapp()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment) {
        label.text = comment.body
    }


}
