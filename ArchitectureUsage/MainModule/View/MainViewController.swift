//
//  ViewController.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "fwweff"

        return cell
    }


}

extension MainViewController: MainViewProtocol {
    func succes() {
        <#code#>
    }

    func failure() {
        <#code#>
    }
}
