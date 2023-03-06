//
//  MainPresenter.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import Foundation

protocol MainViewProtocol: Any {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: Any {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter:MainViewPresenterProtocol {

    let view: MainViewProtocol
    let person: Person

    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let greeting = "\(person.firstName) + \(person.firstName)"
        view.setGreeting(greeting: greeting)
    }


}
