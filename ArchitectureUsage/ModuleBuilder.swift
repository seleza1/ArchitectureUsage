//
//  ModuleBuilder.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

class ModelBuilder: Builder {

    static func createMain() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter

        return view
    }

    static func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter

        return view
    }
}
