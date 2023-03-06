//
//  MainPresenter.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure()
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkService)
}

class MainPresenter:MainViewPresenterProtocol {
    unowned let view: MainViewProtocol
    let networkService: NetworkServiceProtocol!

    required init(view: MainViewProtocol, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }
}
