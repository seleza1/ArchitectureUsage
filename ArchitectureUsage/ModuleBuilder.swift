//
//  ModuleBuilder.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule() -> UIViewController
    func createDetailModule(comment: Comment?) -> UIViewController
}

class ModelBuilder: AssemblyBuilderProtocol {

    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter

        return view
    }

    func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter

        return view
    }
}
