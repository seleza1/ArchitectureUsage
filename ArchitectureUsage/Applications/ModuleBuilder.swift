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
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter

        return view
    }
}
