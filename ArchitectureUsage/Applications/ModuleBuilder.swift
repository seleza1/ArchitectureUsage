//
//  ModuleBuilder.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMain() -> UIViewController {
        let person = Person(firstName: "Selezza", lastName: "crame")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: person)
        view.presenter = presenter

        return view
    }
}
