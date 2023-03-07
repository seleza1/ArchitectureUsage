//
//  DetailPresenter.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject { //input
    func setComment(comment: Comment)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkService, router: RouterProtocol, comment: Comment?)
    func setComment() // output
    func tapp()
}

class DetailPresenter: DetailViewPresenterProtocol {
    func tapp() {
        router?.popToRoot()
    }

    var router: RouterProtocol?
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comment: Comment?

    required init(view: DetailViewProtocol, networkService: NetworkService, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }

    func setComment() {
        view?.setComment(comment: comment!)
    }
}
