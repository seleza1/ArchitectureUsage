//
//  ViewController.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!

    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showGreetingButton(_ sender: UIButton) {
        presenter.showGreeting()
    }

}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }


}

